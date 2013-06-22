private
skipWhiteSpace: stream
	[ stream atEnd not and: [ (self valueForCharacter: stream peek) isNil ] ] 
		whileTrue: [ stream next ]