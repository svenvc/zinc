private
processNext
	| item |
	stream atEnd ifTrue: [ ^ nil ].
	(item := stream next) ifNil: [ ^ nil ].
	stream isBinary ifTrue: [ item := item asCharacter ].
	"Terminate on LF (Unix style or part of CRLF)"
	item == Character lf ifTrue: [ ^ nil ].
	"Terminate on CR (Mac style or start of CRLF)"
	item == Character cr ifTrue: [ "Consume trailing LF if present"
			(stream atEnd not and: [ stream peek asCharacter == Character lf ]) ifTrue: [
				stream next ].
			^ nil ].
	self store: item.
	^ item