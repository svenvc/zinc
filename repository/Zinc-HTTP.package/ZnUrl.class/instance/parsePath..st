parsing
parsePath: stream
	stream peekFor: $/.
	[ stream atEnd ] whileFalse: [ | segment |
		segment := String streamContents: [ :stringStream |
			[ stream atEnd not and: [ stream peek ~= $/ ] ] whileTrue: [
				stringStream nextPut: stream next ] ].
		(segment isEmpty or: [ segment = '.' ])
			ifFalse: [
				segment = '..' 
					ifTrue: [ self removeLastPathSegment ]
					ifFalse: [ self addPathSegment: (ZnUtils decodePercent: segment) ] ].
		((stream peekFor: $/) and: [ stream atEnd ])
			ifTrue: [ self closePath ] ]