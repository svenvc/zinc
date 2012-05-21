testing
testErrorHandler
	self ignoringDeprecation: [ | client flag |
		flag := false.
		client := ZnUserAgent new errorHandler: [ :error | flag := true ].
		client get: ''.
		self assert: flag ]