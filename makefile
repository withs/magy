doc:
	v doc -f html -o . -inline-assets -m .

prod:
	v -prod -shared -autofree .

build:
	v -cg -shared -autofree .

test:
	v test .

fmt:
	v fmt -w .
