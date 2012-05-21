accessing
info: message
	self enabled 
		ifTrue: [
			self announcer announce: (ZnLogEvent info: message value) ]
	