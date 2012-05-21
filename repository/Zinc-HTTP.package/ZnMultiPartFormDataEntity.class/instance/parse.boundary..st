private
parse: bytes boundary: boundary
	| next start fullBoundary |
	fullBoundary := #(45 45) asByteArray , boundary.
	start := fullBoundary size + 1.
	next := bytes
		indexOfSubCollection: fullBoundary
		startingAt: start 
		ifAbsent: [ bytes size ].
	[ next < (bytes size - 2) ] whileTrue: [
		self addPart: (ZnMimePart readFrom: (bytes copyFrom: start + 2 to: next - 3) readStream).
		start := next + fullBoundary size.
		next := bytes
			indexOfSubCollection: fullBoundary
			startingAt: start
			ifAbsent: [ bytes size ] ]