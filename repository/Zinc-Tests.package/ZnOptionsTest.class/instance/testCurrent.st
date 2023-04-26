tests
testCurrent
	| options |
	self should: [ ZnCurrentOptions at: #foo ] raise: KeyNotFound.
	options := (ZnOptions onClass: self class) clone.
	self assert: (options at: #foo) equals: 1.
	options during: [
		self assert: (ZnCurrentOptions at: #foo) equals: 1 ].
	options clone
		at: #foo put: -1;
		during: [
			self assert: (ZnCurrentOptions at: #foo) equals: -1 ].
	self assert: (options at: #foo) equals: 1