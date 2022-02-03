testing
testQuery
	| url |
	url := 'http://foo.com/test?q' asZnUrl.
	self assert: url printString equals: 'http://foo.com/test?q'