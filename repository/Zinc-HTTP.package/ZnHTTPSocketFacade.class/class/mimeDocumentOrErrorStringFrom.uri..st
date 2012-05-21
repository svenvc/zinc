private
mimeDocumentOrErrorStringFrom: response uri: uri
	^ (#(200 201) includes: response statusLine code)
		ifTrue: [
			MIMEDocument
				contentType: response contentType asString
				content: response entity contents 
				url: uri asString ]
		ifFalse: [ 
			String streamContents: [ :stream |
				stream nextPutAll: 'HTTP request for '; print: uri; nextPutAll: ' failed with '.
				response statusLine writeOn: stream ] ]
		