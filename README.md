# [Please see the full site](https://portability.cl/)

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
            :since-library-version "1.0.0"         ; Which library version started supporting the implementation
            :since-implementation-version "1.0.0"  ; Which implementation version started supporting this feature
            :notes "Some caveat notes")))          ; Notes on what is not supported / other quirks
```

If there is a new library, please contribute a corresponding entry. If you are the maintainer of a library and notice that your entry is outdated, please send a [PR](https://github.com/Shinmera/portability/pulls) with an update. You should be able to [directly edit](https://github.com/Shinmera/portability/blob/master/data.lisp) the file on GitHub to make that convenient.

When you push or send a PR, GitHub should automatically run CI to generate the `index.html` file based on the new data and push the result to the `gh-pages` branch. This ensures that no manual steps need to be performed to keep the public website up to date.

# Compiling
If you have SBCL, simply call `make`. Otherwise, `(load "make.lisp")` and call `(make)`.
