private
streamOrErrorStringFrom: response uri: uri
	^ (#(200 201) includes: response statusLine code)
		ifTrue: [
			(RWBinaryOrTextStream with: response entity contents) 
				reset; 
				yourself ]
		ifFalse: [ 
			String streamContents: [ :stream |
				stream nextPutAll: 'HTTP request for '; print: uri; nextPutAll: ' failed with '.
				response statusLine writeOn: stream ] ]
		