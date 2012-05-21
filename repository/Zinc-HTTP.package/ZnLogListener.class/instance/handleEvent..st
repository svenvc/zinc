accessing
handleEvent: logEvent
	(self enabled and: [ self acceptEvent: logEvent ])
		ifTrue: [ 
			lock critical: [ self event: logEvent ] ]  