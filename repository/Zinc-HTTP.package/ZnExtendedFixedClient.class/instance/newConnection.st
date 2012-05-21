private
newConnection
	| newConnection |
	newConnection := super newConnection.
	newConnectionHook notNil ifTrue: [
		newConnectionHook value: newConnection ].  
	^ newConnection 