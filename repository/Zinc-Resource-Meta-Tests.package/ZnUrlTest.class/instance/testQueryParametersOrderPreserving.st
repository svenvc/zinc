testing
testQueryParametersOrderPreserving
	| url |
	url := 'http://foo.com/api/do?z=0&a=1&b=2&m=7&c=3'.
	self assert: url asZnUrl printString equals: url