testing
atEnd
	| boolean |
	boolean := stream atEnd.
	logLevel > 1
		ifTrue: [
			logger value: ('{1} atEnd: {2}' format: { identifier. boolean }) ].
	^ boolean