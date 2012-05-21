accessing-path
directory
	^ self isDirectory
		ifTrue: [ self path ]
		ifFalse: [ self joinSegments: segments allButLast ]