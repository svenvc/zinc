accessing
method: aSymbol

	method := (ZnCurrentOptions at: #allowedMethods)
		detect: [ :each | each = aSymbol ]
		ifNone: [ (ZnUnknownHttpMethod method: aSymbol) signal ]