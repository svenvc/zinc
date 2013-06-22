writing
writeRepresentationOn: stream
	self contentType charSet
		ifNotNil: [:charSet|
			ZnResourceMetaUtils
				writeQueryFields: self fields 
				withTextEncoding: charSet 
				on: stream] 
		ifNil: [ 
			ZnResourceMetaUtils 
				writeQueryFields: self fields 
				on: stream ]