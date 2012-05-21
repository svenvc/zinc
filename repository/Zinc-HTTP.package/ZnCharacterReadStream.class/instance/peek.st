accessing
peek
	^ peekedCharacter
		ifNil: [
			stream atEnd
				ifFalse: [ 
					peekedCharacter := self encoder nextFromStream: stream ] ]
