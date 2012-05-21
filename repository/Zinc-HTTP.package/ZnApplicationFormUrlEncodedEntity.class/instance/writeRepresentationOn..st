writing
writeRepresentationOn: stream
	self contentType charSet
		ifNotNil: [:charSet|
			ZnUtils 
				writeQueryFields: self fields 
				withTextEncoding: charSet 
				on: stream] 
		ifNil: [ 
			ZnUtils 
				writeQueryFields: self fields 
				on: stream ]