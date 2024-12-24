error handling
errorOutsideRange: codePoint to: stream
	| errorMessage |
	errorMessage := self writeErrorBlock value: codePoint.
	errorMessage isByteString
		ifFalse: [ errorMessage := self defaultWriteErrorBlock value: codePoint ].
	stream nextPutAll: errorMessage asByteArray