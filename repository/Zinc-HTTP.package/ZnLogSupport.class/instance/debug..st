accessing
debug: message
	self enabled 
		ifTrue: [  
			self announcer announce: (ZnLogEvent debug: message value) ]
	