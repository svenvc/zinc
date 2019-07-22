accessing
peek
	"We do byte/char conversions on the fly."

	^ self atEnd
		ifTrue: [ nil ]
		ifFalse: [ binary
				ifNil: [ stream peek ]
				ifNotNil: [ binary
						ifTrue: [ stream peek asInteger ]
						ifFalse: [ stream peek asCharacter ]]]