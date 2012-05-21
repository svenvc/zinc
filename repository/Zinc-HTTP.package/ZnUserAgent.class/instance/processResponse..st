private-protocol
processResponse: stream
	| cookies |
	response := (request method = #HEAD) 
		ifTrue: [ ZnResponse readHeaderFrom: stream ]
		ifFalse: [ ZnResponse readFrom: stream ].
	self log debug: [ response printString ].
	cookies := response headers at: 'Set-Cookie' ifAbsent: [ ^ response ].
	cookies := (cookies isCollection & cookies isString) ifTrue: [ Array with: cookies ] ifFalse: [ cookies ].
	cookies do: [ :cookie | 
		self session cookieJar add: (ZnCookie fromString: cookie for: self request url) ].
	^ response 