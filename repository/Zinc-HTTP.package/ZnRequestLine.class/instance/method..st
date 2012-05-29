as yet unclassified
method: string
	method := ZnConstants knownHTTPMethods 
		detect: [ :each | each = string asSymbol ] 
		ifNone: [ (ZnUnknownHttpMethod method: string) signal ]