testing
testQueryManipulation
	| url |
	url := 'http://www.google.com/?one=1&two=2' asZnUrl.
	url queryAt: 'three' put: '3'.
	url queryRemoveKey: 'one'.
	self assert: url queryKeys sorted equals: #('three' 'two').
	self assert: (url queryAt: 'two') equals: '2'.
	self assert: (url queryAt: 'three') equals: '3'.
	url queryRemoveAll.
	self deny: url hasQuery