doc:
	v doc -f html -o . -inline-assets -m .

prod:
	v -prod -shared -autofree magy.v

build:
	v -cg -shared -autofree magy.v

test:
	v test .

fmt:
	v fmt -w .
