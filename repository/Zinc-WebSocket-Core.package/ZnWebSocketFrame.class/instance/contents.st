accessing
contents
	self assert: self isControl not.
	^ self isText
		ifTrue: [ self text ]
		ifFalse: [ body ]