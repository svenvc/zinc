accessing
next
	"Answer the next character from the stream, converting end-of-lines to CRLF"

	| byte |

	next ifNotNil:
		[ byte := next.
		next := nil.
		^byte ].
	stream atEnd ifTrue: [ ^nil ].
	(byte := stream next) ifNil: [ ^nil ].
	byte == Cr ifTrue:
		"Consume the Cr and ensure that a Lf is answered next.
		If the following character is Lf, consume it."
		[ stream peek == Lf ifTrue:
			[ stream next ].
		next := Lf ]
	ifFalse: [ byte == Lf ifTrue:
		[ "Answer a Cr instead, and then a Lf"
		byte := Cr.
		next := Lf ] ].
	^byte