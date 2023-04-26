tests
testRedirect
	self
		withServerDo: [ :server |
			| client |
			(client := ZnClient new)
				beOneShot;
				url: server localUrl;
				addPath: #('local-files');
				get.
			self assert: client isSuccess.
			self assert: client response contentType equals: ZnMimeType textHtml.
			self assert: client contents equals: self indexHtml.
			self assert: (ZnUtils parseHttpDate: (client response headers at: 'Modification-Date')) equals: (ZnFileSystemUtils modificationTimeFor: 'index.html') asUTC.
			self assert: (ZnUtils parseHttpDate: (client response headers at: 'Expires')) > (DateAndTime now + 10 days).
			self assert: (client response headers at: 'Cache-Control') equals: (server delegate maxAgeFor: ZnMimeType textHtml) ]