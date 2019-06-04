# About
This is a metadata project to document the coverage of portability libraries across the many Lisp implementations. It was created in the hopes that this would allow people a quicker overview of non-standard features and encourage people to contribute to the projects and implementations and close the gaps.

# Contributing
Please see the `data.lisp` file. All the data should be in there and follow this format:

``` Lisp
(library-name
 :link "https://example.com"
 :description "A short explanation of what it makes portable"
 :support (:supported-implementation
           (:supported-implementation-with-caveat
            :completeness 0.8                      ; How much of the API is supported (approx.)
            :notes "Some caveat notes")))          ; Notes on what is not supported / other quirks
```

If there is a new library, please contribute a corresponding entry. If you are the maintainer of a library and notice that your entry is outdated, please send a [PR](https://github.com/Shinmera/portability/pulls) with an update. You should be able to [directly edit](https://github.com/Shinmera/portability/blob/master/data.lisp) the file on GitHub to make that convenient.

# Compiling
If you have SBCL, simply call `make`. Otherwise, `(load "make.lisp")` and call `(make)`.
