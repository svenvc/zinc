accessing-path
directory
	^ self isDirectoryPath
		ifTrue: [ self path ]
		ifFalse: [ self joinSegments: segments allButLast ]