operations
readNetscapeFormatFrom: fileReference
	| cookie |
	fileReference readStreamDo: [ :fileStream | 
		(ZnFastLineReader on: fileStream) linesDo: [ :each | 
			(each beginsWith: '#')
				ifFalse: [ cookie := ZnCookie new.
					cookie fromNetscapeString: each.
					self add: cookie ] ] ]