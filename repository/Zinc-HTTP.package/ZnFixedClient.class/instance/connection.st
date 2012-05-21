accessing
connection
	(self isConnected and: [ self isConnectionReusable ])
		ifFalse: [ 
			self close.
			connection := self newConnection ].
	^ connection