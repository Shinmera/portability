(float-features
 :link "https://shinmera.github.io/float-features"
 :description "IEEE floating point number extensions such as infinities, NaN handling, and trap masking."
 :support (:abcl :allegro :ccl :clasp :cmucl :ecl :mkcl :sbcl))

(trivial-arguments
 :link "https://shinmera.github.io/trivial-arguments"
 :description "Retrieve the lambda-list of a function."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :lispworks :sbcl :scl))

(atomics
 :link "https://shinmera.github.io/atomics"
 :description "Thin wrapper over atomic operators such as Compare and Swap (CAS)."
 :support (:allegro :ccl :ecl :lispworks (:sbcl :notes "foo")))

(definitions
 :link "https://shinmera.github.io/definitions"
 :description "Portable definitions reflection library, including source location tracking."
 :default-completeness 0.75
 :support (:ccl :clasp :sbcl))

(trivial-garbage
 :link "https://common-lisp.net/project/trivial-garbage/"
 :description "Access to GC related tasks such as weak pointers, weak tables, and finalizers."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :lispworks :sbcl :scl))

(trivial-features
 :link "https://github.com/trivial-features/trivial-features"
 :description "Standardised platform features for CPU architectures and operating systems."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :lispworks :mcl :mkcl :mocl :sbcl :scl :xcl))

(bordeaux-threads
 :link "https://github.com/sionescu/bordeaux-threads"
 :description "Basic multithreading constructs including locks and condition variables."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :genera :lispworks :mcl :mkcl :scl :sbcl))

(closer-mop
 :link "https://github.com/pcostanza/closer-mop"
 :description "For the common Meta-Object Protocol extension to CLOS."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :ecl :lispworks :mcl :sbcl :sbcl))

(uiop
 :link "https://common-lisp.net/project/asdf/uiop.html"
 :description "The general toolkit library shipped with ASDF. Handles pathnames, filesystems, external processes, and more."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :gcl :genera :lispworks :mcl :mezzano :mkcl :mocl :scl :sbcl :xcl))

(usocket
 :link "https://common-lisp.net/project/usocket/"
 :description "POSIX/BSD sockets to establish TCP or UPD connections and servers."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :ecl :genera :lispworks :mcl :mocl :sbcl :scl))
