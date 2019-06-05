#+quicklisp (ql:quickload :clip)
#-quicklisp (asdf:load-system :clip)

(defvar *this* #.(or *load-pathname* (error "Please LOAD this file.")))
(defparameter *known-implementations*
  '(:abcl :allegro :ccl :clasp :clisp :corman :ecl
    :gcl :genera :jscl :lispworks :mcl :mkcl :mocl
    :mezzano :sbcl :scl :sicl :xcl))

(defun unmaintained-p (implementation)
  (find implementation '(:gcl :genera :mcl :scl :xcl)))

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
   (completeness :initarg :completeness :reader completeness)
   (notes :initarg :notes :reader notes))
  (:default-initargs
   :library (error "LIBRARY required.")
   :implementation (error "IMPLEMENTATION required.")
   :completeness 0.0
   :notes NIL))

(defun make-support-table (library support &optional (default-completeness 0.0))
  (loop for implementation in *known-implementations*
        for part = (find-implementation-part support implementation)
        collect (if part
                    (destructuring-bind (name &key (completeness 1.0) notes) (if (listp part) part (list part))
                      (make-instance 'support :library library :implementation name :completeness completeness :notes notes))
                    (make-instance 'support :library library :implementation implementation :completeness default-completeness))))

(defun support-style (support)
  (let ((value (floor (* 255 (completeness support)))))
    (format NIL "background: rgb(~d,~d,0)" (- 255 value) value)))

(defmethod id ((support support))
  (format NIL "~a-note-~a"
          (id (library support))
          (string-downcase (implementation support))))

(defmethod link (thing)
  (format NIL "#~a" (id thing)))

(defun completeness% (support)
  (format NIL "~d%" (round (* 100 (completeness support)))))

(defclass library ()
  ((name :initarg :name :reader name)
   (link :initarg :link :reader link)
   (description :initarg :description :reader description)
   (support-table :reader support-table))
  (:default-initargs
   :name (error "NAME required.")
   :link NIL
   :description NIL))

(defmethod initialize-instance :after ((library library) &key support (default-completeness 0.0))
  (setf (slot-value library 'support-table) (make-support-table library support default-completeness)))

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
