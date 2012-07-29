private
parse: bytes boundary: boundary
	| next start fullBoundary |
	fullBoundary := '--' asByteArray, boundary.
	start := fullBoundary size + 1.
	next := bytes
		indexOfSubCollection: fullBoundary
		startingAt: start 
		ifAbsent: [ bytes size ].
	[ next < (bytes size - 2) ] whileTrue: [ | partReadStream |
		partReadStream := ReadStream on: bytes from: start + 2 to: next - 3.
		self addPart: (ZnMimePart readFrom: partReadStream).
		start := next + fullBoundary size.
		next := bytes
			indexOfSubCollection: fullBoundary
			startingAt: start
			ifAbsent: [ bytes size ] ]