testing
testSlashdotGzipChunked
	| request stream response contents |
	(request := ZnRequest get: 'http://slashdot.org')
		setConnectionClose;
		setAcceptEncodingGzip.
	stream := ZnNetworkingUtils socketStreamToUrl: request url.
	response := [ 
  		request writeOn: stream. 
  		stream flush. 
  		ZnResponse readFrom: stream ] ensure: [ stream close ].
	response isRedirect ifTrue: [ ^ self ].
	self assert: response code = 200.
	self assert: ((response headers at: 'Content-Type') beginsWith: 'text/html').
	self assert: (response headers at: 'Content-Encoding' ifAbsent: [ 'gzip' ]) = 'gzip'.
	self assert: (response headers at: 'Transfer-Encoding' ifAbsent: [ 'chunked' ]) = 'chunked'.
	contents := response entity contents.
	self assert: ((contents includesSubString: 'Slashdot') or: [ contents includesSubString: 'refresh' ])
