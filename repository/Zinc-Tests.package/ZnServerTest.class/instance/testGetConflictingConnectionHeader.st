testing
testGetConflictingConnectionHeader
	self withServerDo: [ :server | | client |
		client := ZnClient new.
		client url: server localUrl; addPathSegment: #echo.
		"There are not supposed to be 2 Connection headers, the last one should win"
		client headerAt: 'Connection' add: 'keep-alive'.
		client headerAt: 'Connection' add: 'close'.
		client get.
		self assert: client isSuccess.
		self assert: (client contents includesSubstring: 'echo').
		self assert: client response isConnectionClose.
		client close ]