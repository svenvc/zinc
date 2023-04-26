accessing
next
	"Return the next element and move over it"

	| next |
	delta = 0
		ifTrue: [
			(next := stream next) ifNotNil: [
				count := count + 1.
				buffer at: index + 1 put: next.
				index := (index + 1) \\ buffer size ] ]
		ifFalse: [
			next := buffer at: ((index - delta) \\ buffer size) + 1.
			delta := delta - 1 ].
	^ next