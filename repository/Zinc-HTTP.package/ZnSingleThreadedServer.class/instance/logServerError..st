logging
logServerError: exception
	(self logServerErrorDetails and: [ self log enabled ])
		ifTrue: [ | report |
			report := String streamContents: [ :out | 
							out print: exception; cr.
							exception signalerContext printDetails: out.
							exception signalerContext sender debugStack: 8 on: out ].
			report linesDo: [ :each | self log debug: each ] ]