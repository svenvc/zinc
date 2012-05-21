testing
testQueryEncoding
	| url |
	url := 'http://www.google.com' asZnUrl.
	url addPathSegment: 'some encoding here'.
	url queryAt: 'and some encoding' put: 'here, too'.
	self assert: url printString = 'http://www.google.com/some%20encoding%20here?and%20some%20encoding=here%2C%20too'.
	self assert: url path =  'some encoding here'.
	self assert: (url queryAt: 'and some encoding') = 'here, too'
	