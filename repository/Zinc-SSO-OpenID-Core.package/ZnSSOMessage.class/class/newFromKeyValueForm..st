instance creation
newFromKeyValueForm: aString

	| eolChar msg stream |
	
	eolChar := (aString includes: Character lf)
		ifTrue: [ Character lf ]
		ifFalse: [ Character cr ].
	
	msg := self new.
	stream := ReadStream on: aString.
	[ stream atEnd ] whileFalse: [
		msg propertyAt: (stream upTo: $:) put: (stream upTo: eolChar)].
	^msg