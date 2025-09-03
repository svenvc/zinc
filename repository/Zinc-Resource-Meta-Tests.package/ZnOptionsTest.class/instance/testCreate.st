tests
testCreate
	| options |
	options := ZnOptions onClass: self class.
	self assert: (options at: #foo) equals: 1.
	self assert: (options at: #bar) equals: 2.
	self assert: (options includesKey: #foo).
	self should: [ options at: #foo put: 0 ] raise: ModificationForbidden.
	self should: [ options at: #xyz ] raise: KeyNotFound.
	self should: [ options at: #xyz put: -1 ] raise: ModificationForbidden.
	self should: [ options writable: true ] raise: ModificationForbidden