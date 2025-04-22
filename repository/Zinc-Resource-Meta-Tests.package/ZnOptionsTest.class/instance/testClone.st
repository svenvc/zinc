tests
testClone
	| options |
	options := (ZnOptions onClass: self class) clone.
	self assert: (options at: #foo) equals: 1.
	self assert: (options at: #bar) equals: 2.
	options at: #foo put: -1.
	self assert: (options at: #foo) equals: -1.
	self should: [ options at: #xyz ] raise: KeyNotFound.
	self should: [ options at: #xyz put: -1 ] raise: KeyNotFound.
	options reset.
	self assert: (options at: #foo) equals: 1.