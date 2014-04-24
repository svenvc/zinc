accessing
addListener: logListener
	self enable.  
	self announcer on: ZnLogEvent send: #handleEvent: to: logListener 