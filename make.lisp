#+quicklisp (ql:quickload :clip)
#-quicklisp (asdf:load-system :clip)

(defvar *this* #.(or *load-pathname* (error "Please LOAD this file.")))
(defparameter *known-implementations*
  (sort '(:abcl :allegro :ccl :clasp :clisp :cmucl
          :corman :ecl :gcl :genera :jscl :lispworks
          :mcl :mkcl :mocl :mezzano :sbcl :scl :xcl)
        #'string<))

(defun unmaintained-p (implementation)
  (find implementation '(:gcl :genera :mcl :scl :xcl :mocl)))

(defun file (relative)
  (merge-pathnames relative (make-pathname :name NIL :type NIL :version NIL :defaults *this*)))

(defun find-implementation-part (support implementation)
  (loop for part in support
        do (when (or (eq part implementation)
                     (and (listp part) (eq (car part) implementation)))
             (return part))))

(defclass support ()
  ((library :initarg :library :reader library)
   (implementation :initarg :implementation :reader implementation)
   (completion :initarg :completion :reader completion)
   (since-library-version :initarg :since-library-version :reader since-library-version)
   (since-implementation-version :initarg :since-implementation-version :reader since-implementation-version)
   (notes :initarg :notes :reader notes))
  (:default-initargs
   :library (error "LIBRARY required.")
   :implementation (error "IMPLEMENTATION required.")
   :completion 1.0
   :since-library-version NIL
   :since-implementation-version NIL
   :notes NIL))

(defun make-support-table (library support &optional (default-completion 0.0))
  (sort
   (loop for implementation in *known-implementations*
         for part = (find-implementation-part support implementation)
         collect (if part
                     (destructuring-bind (name &rest initargs) (if (listp part) part (list part))
                       (apply #'make-instance 'support :library library :implementation name initargs))
                     (make-instance 'support :library library :implementation implementation :completion default-completion)))
   #'string< :key #'implementation))

(defun support-style (support)
  (let ((value (floor (* 255 (completion support)))))
    (format NIL "background: rgb(~d,~d,0)" (- 255 value) value)))

(defmethod id ((support support))
  (format NIL "~a-note-~a"
          (id (library support))
          (string-downcase (implementation support))))

(defmethod link (thing)
  (format NIL "#~a" (id thing)))

(defun completion% (support)
  (format NIL "~d%" (round (* 100 (completion support)))))

(defun format-absolute-time (&optional (time (get-universal-time)))
  (multiple-value-bind (s m h dd mm yy) (decode-universal-time time 0)
    (declare (ignore s m h))
    (format NIL "~4,'0d.~2,'0d.~2,'0d" yy mm dd)))

(defclass library ()
  ((name :initarg :name :reader name)
   (link :initarg :link :reader link)
   (description :initarg :description :reader description)
   (support-table :reader support-table))
  (:default-initargs
   :name (error "NAME required.")
   :link NIL
   :description NIL))

(defmethod initialize-instance :after ((library library) &key support (default-completion 0.0))
  (setf (slot-value library 'support-table) (make-support-table library support default-completion)))

(defun make-library (entry)
  (destructuring-bind (name &rest initargs) entry
    (apply #'make-instance 'library :name name initargs)))

(defmethod id ((library library))
  (format NIL "~a" (string-downcase (name library))))

(defun read-data (&key (input (file "data.lisp")))
  (with-open-file (stream input :direction :input
                                :element-type 'character
                                :if-does-not-exist :error)
    (sort
     (loop with *package* = #.*package*
           for entry = (read stream NIL)
           while entry
           collect (make-library entry))
     #'string< :key #'name)))

(defun compile-index (libraries &key (output (file "index.html")) (template (file "template.ctml")))
  (with-open-file (stream output :direction :output
                                 :element-type 'character
                                 :if-exists :supersede)
    (let ((plump:*tag-dispatchers* plump:*html-tags*))
      (plump:serialize (plump-dom:strip
                        (clip:process (plump:parse (pathname template))
                                      :implementations *known-implementations*
                                      :libraries libraries))
                       stream))))

(defun make ()
  (compile-index (read-data)))
