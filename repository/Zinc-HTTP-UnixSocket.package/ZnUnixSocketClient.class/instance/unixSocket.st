accessing
unixSocket
	^ self optionAt: #unixSocket ifAbsent: [ nil ]