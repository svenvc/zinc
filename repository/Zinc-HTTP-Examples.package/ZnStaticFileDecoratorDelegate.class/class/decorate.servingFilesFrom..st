public
decorate: aDelegate servingFilesFrom: aPathString
	^ self new
		delegate: aDelegate;
		path: aPathString