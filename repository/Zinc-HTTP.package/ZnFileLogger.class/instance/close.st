initialize-release
close
	self stream ifNil: [ ^ self ].
	self event: (ZnLogEvent info: 'Closing ', self printString).
	stream close. 
	stream := nil