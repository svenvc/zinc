accessing
method: aSymbol

	method := ZnConstants knownHTTPMethods
		detect: [ :each | each = aSymbol ]
		ifNone: [ (ZnUnknownHttpMethod method: aSymbol) signal ]