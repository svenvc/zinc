testing
testTransfersGzip
	| client |
	self timeLimit: 300 seconds.
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	(client := self httpClient)
		https;
		host: 'stfx.eu';
		setAcceptEncodingGzip.
	(Integer primesUpTo: 100) do: [ :each | | size |
		size := 1024 * each + each.
		client
			url: ('test-{1}.txt' format: { size });
			setAcceptEncodingGzip;
			get.
		self assert: client isSuccess.
		self assert: (client response contentType matches: ZnMimeType textPlain).
		self assert: client response contentLength equals: size.
		self assert: (client response headers at: 'Content-Encoding') equals: 'gzip'.
		self 
			assert: client contents 
			equals: (self class generateTestData: size)	 ]