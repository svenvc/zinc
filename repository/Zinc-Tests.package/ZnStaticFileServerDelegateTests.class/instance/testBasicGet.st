tests
testBasicGet
	self withServerDo: [ :server | | client |
		(client := ZnClient new) 
			beOneShot;
			url: server localUrl;
			addPath: #('local-files' 'small.html');
			get.
		self assert: client isSuccess.
		self assert: client response contentType = ZnMimeType textHtml.
		self assert: (client contents includesSubString: 'Small').
		self 
			assert: (ZnUtils parseHttpDate: (client response headers at: 'Modification-Date'))
			equals: (FileDirectory default directoryEntryFor: 'small.html') modificationDateAndTime asUTC asTimeStamp.
		self 
			assert: (ZnUtils parseHttpDate: (client response headers at: 'Expires')) > (DateAndTime now + 10 days).
		self 
			assert: (client response headers at: 'Cache-Control')
			equals: (server delegate maxAgeFor: ZnMimeType textHtml) ]