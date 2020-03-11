(float-features
 :link "https://shinmera.github.io/float-features"
 :description "IEEE floating point number extensions such as infinities, NaN handling, and trap masking."
 :support (:abcl :cmucl :ecl :ccl :sbcl
           (:allegro :completion 0.9)
           (:clasp :completion 0.9)
           (:clisp :completion 0.1)
           (:lispworks :completion 0.9)
           (:mkcl :completion 0.9)))

(trivial-arguments
 :link "https://shinmera.github.io/trivial-arguments"
 :description "Retrieve the lambda-list of a function."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :lispworks :sbcl :scl))

(atomics
 :link "https://shinmera.github.io/atomics"
 :description "Thin wrapper over atomic operators such as Compare and Swap (CAS)."
 :support (:allegro :ccl :ecl :lispworks :sbcl))

(definitions
 :link "https://shinmera.github.io/definitions"
 :description "Portable definitions reflection library, including source location tracking."
 :default-completion 0.75
 :support (:ccl :clasp :sbcl))

(dissect
 :link "https://shinmera.github.io/dissect"
 :description "Capturing the call stack and inspecting frames."
 :support (:abcl :allegro :ccl :clisp :ecl :sbcl))

(trivial-garbage
 :link "https://common-lisp.net/project/trivial-garbage/"
 :description "Access to GC related tasks such as weak pointers, weak tables, and finalizers."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :lispworks :sbcl :scl))

(trivial-features
 :link "https://github.com/trivial-features/trivial-features"
 :description "Standardised platform features for CPU architectures and operating systems."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :lispworks :mcl :mezzano :mkcl :mocl :sbcl :scl :xcl))

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
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :genera :lispworks :mcl :mocl :sbcl :scl))

(cffi
 :link "https://common-lisp.net/project/cffi/"
 :description "Direct memory manipulation and interaction with foreign libraries following the C ABIs."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :corman :ecl :lispworks :mcl :mkcl :scl :sbcl))

(trivial-backtrace
 :link "https://common-lisp.net/project/trivial-backtrace/"
 :description "Printing the current stack trace to a string."
 :support (:allegro :ccl :clasp :clisp :cmucl :lispworks :mcl :sbcl :scl))

(trivial-cltl2
 :link "https://github.com/Zulu-Inuoe/trivial-cltl2"
 :description "Some of the extensions described in CLtL2 that were not included in ANSI."
 :support (:abcl :allegro :ccl :cmucl :ecl :sbcl))

(cl-environments
 :link "https://github.com/alex-gutev/cl-environments"
 :description "Environment introspection as described in CLtL2."
 :support (:abcl :allegro :ccl :clisp :cmucl :ecl :lispworks :sbcl))

(static-vectors
 :link "https://github.com/sionescu/static-vectors"
 :description "Simple arrays that don't move in memory and can be shared with foreign systems."
 :support (:allegro :ccl :clasp :cmucl :ecl :lispworks :sbcl))

(trivial-gray-streams
 :link "https://github.com/trivial-gray-streams/trivial-gray-streams"
 :description "Custom stream classes through a CLOS protocol."
 :support (:abcl :allegro :ccl :clasp :clisp :cmucl :ecl :genera :lispworks :mocl :sbcl))

(shut-it-down
 :link "http://verisimilitudes.net/2017-12-30"
 :description "Allow for exiting the Lisp process."
 :support (:abcl :allegro :ccl :clasp :clisp :corman :ecl :gcl :lispworks :mcl :mkcl :mocl :sbcl :scl :xcl))

(trivial-extensible-sequences
 :link "https://shinmera.github.io/trivial-extensible-sequences"
 :description "Custom sequence classes through a CLOS protocol."
 :support (:abcl :sbcl))

(trivial-package-local-nicknames
 :link "https://github.com/phoe/trivial-package-local-nicknames"
 :description "Package nicknames that are local to another package, avoiding package naming conflicts."
 :support (:abcl :allegro (:ccl :since-implementation-version "1.12") :clasp :ecl (:lispworks :since-implementation-version "7.2") :sbcl))

(global-vars
 :link "https://github.com/lmj/global-vars"
 :description "Unrebindable global variables."
 :support (:sbcl :ccl :lispworks))

(trivial-with-current-source-form
 :link "https://github.com/scymtym/trivial-with-current-source-form"
 :description "Allows macro writers to provide better feedback to macro users when errors are signaled during macroexpansion."
 :support ((:sbcl :since-implementation-version "1.3.13" :since-library-version "1.0.0")))

(trivial-file-size
 :link "https://github.com/ruricolist/trivial-file-size"
 :description "Query a file's size from its metadata."
 :support (:sbcl :ccl :cmucl :clisp :allegro :abcl :gcl
                 (:lispworks :completion 0.5)
                 (:ecl :completion 0.5)))
