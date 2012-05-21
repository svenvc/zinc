testing
testGetJpeg
	| url result |
	url := 'http://caretaker.wolf359.be/sun-fire-x2100.jpg'.
	result := ZnEasy getJpeg: url.
	self assert: result isForm