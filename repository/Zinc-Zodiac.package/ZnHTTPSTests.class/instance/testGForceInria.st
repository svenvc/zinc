testing
testGForceInria
	| client |
	self ensureSocketStreamFactory.     
	(client := ZnClient new)
		get: 'http://gforge.inria.fr/frs/?group_id=1299'.
	self assert: client isSuccess.
	self assert: (client contents includesSubString: 'INRIA').
	client close