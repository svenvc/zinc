private
closeConnections
	self hasOpenConnections ifFalse: [ ^ self ].
	self lock critical: [
		self connections do: [ :each |
			self logConnectionClosed: each.
			[ each close ]
				on: Exception
				do: [ #ignore ] ].
		self connections removeAll ]