utility
decodeRFC3339Date: aString

	| stream date time |
	
	stream := aString readStream.
	date := Date readFrom: stream.
	(stream next asUppercase = $T and: [ aString last asUppercase = $Z ])
		ifFalse: [ self error: 'Invalid dateTime format' ].
	time := Time readFrom: stream.

	^ DateAndTime year: date year day: date dayOfYear hour: time hour minute: time minute second: time second offset: Duration zero