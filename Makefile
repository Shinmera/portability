all:
	sbcl --disable-debugger --load make.lisp --eval "(make)" --eval "(exit)"
