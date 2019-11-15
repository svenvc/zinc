accessing-path
addPathSegment: segment
	"Modify the receiver's path by adding segment at the end"

	segments ifNil: [ segments := OrderedCollection new ].
	(segments notEmpty and: [ segments last = $/ ])
		ifTrue: [ segments removeLast ].
	segments add: segment