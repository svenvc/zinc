accessing
next
	^ peekedCharacter
		ifNil: [ 
			stream atEnd
				ifFalse: [ self encoder nextFromStream: stream ] ]
		ifNotNil: [ | character |
			character := peekedCharacter.
			peekedCharacter := nil.
			character ]