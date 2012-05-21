private
closeConnections
	self connections isEmpty ifTrue: [ ^ self ].
	self lock critical: [
		self connections do: [ :each | 
			self log debug: [ 'Closing ', each printString ].
			[ each close ] 
				on: Exception 
				do: [ :exception | exception printString, ' during close' ] ].
		self connections removeAll ]