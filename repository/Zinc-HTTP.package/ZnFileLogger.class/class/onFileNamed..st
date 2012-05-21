instance creation
onFileNamed: pathName
	^ self new
		initializeOn: pathName;
		yourself  