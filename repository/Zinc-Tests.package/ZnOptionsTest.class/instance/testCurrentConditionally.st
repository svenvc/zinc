tests
testCurrentConditionally
	| options |
	self should: [ ZnCurrentOptions at: #foo ] raise: KeyNotFound.
	options := (ZnOptions onClass: self class) clone.
	self assert: (options at: #foo) equals: 1.
	options conditionallyDuring: [
		self assert: (ZnCurrentOptions at: #foo) equals: 1 ].
	options clone
		at: #foo put: -1;
		conditionallyDuring: [
			self assert: (ZnCurrentOptions at: #foo) equals: -1 ].
	options clone
		at: #foo put: -1;
		conditionallyDuring: [
			options clone
				at: #foo put: 0;
				conditionallyDuring: [
					self assert: (ZnCurrentOptions at: #foo) equals: -1 ] ].
	self assert: (options at: #foo) equals: 1.