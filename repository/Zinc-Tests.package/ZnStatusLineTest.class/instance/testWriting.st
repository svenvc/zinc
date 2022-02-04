testing
testWriting
	| statusLine string |
	statusLine := ZnStatusLine ok.
	string := String streamContents: [ :stream | statusLine writeOn: stream ].
	self assert: string equals: 'HTTP/1.1 200 OK' , String crlf