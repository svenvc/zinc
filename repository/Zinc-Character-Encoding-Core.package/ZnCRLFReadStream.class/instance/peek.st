accessing
peek
	"Answer the next character from the stream, converting end-of-lines to CRLF"

	| byte |

	next ifNotNil:	[ ^next ].
	stream atEnd ifTrue: [ ^nil ].
	(byte := stream peek) ifNil: [ ^nil ].
	byte == Lf ifTrue: [ ^Cr ].
	^byte