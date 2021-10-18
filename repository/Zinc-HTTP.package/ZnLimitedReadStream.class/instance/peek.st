accessing
peek
	^ self atEnd
		ifTrue: [ nil ]
		ifFalse: [ stream peek ]