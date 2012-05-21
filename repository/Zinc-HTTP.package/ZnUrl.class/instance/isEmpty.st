testing
isEmpty
	^ (self hasScheme | self hasHost | self hasPath | self hasQuery | self hasFragment) not