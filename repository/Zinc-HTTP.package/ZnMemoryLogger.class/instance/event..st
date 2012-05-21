accessing
event: logEvent
	(self limit notNil and: [ self logEvents size >= self limit ])
		ifTrue: [ self shrink ].  
	self logEvents add: logEvent 