accessing
removeListener: logListener
	self announcer unsubscribe: logListener.
	self announcer numberOfSubscriptions isZero 
		ifTrue: [ self disable ]