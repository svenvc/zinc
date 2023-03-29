accessing
position

	^ lastRead
		ifTrue: [ readStream position ]
		ifFalse: [ writeStream position ]