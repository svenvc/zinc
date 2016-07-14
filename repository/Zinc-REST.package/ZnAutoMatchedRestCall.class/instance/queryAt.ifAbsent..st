accessing
queryAt: key ifAbsent: block
	^ self request uri queryAt: key ifAbsent: block