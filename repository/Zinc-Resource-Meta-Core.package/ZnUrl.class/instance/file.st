accessing-path
file
	^ self isDirectoryPath
		ifTrue: [ '' ]
		ifFalse: [ segments last ]