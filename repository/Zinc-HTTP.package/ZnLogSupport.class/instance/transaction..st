accessing
transaction: message
	self enabled 
		ifTrue: [  
			self announcer announce: (ZnLogEvent transaction: message value) ]
	