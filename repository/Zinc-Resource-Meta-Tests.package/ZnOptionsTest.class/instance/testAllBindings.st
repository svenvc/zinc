tests
testAllBindings
	| options |
	options := (ZnOptions onClass: self class) clone.
	self assert: options allBindings equals: { #foo -> 1. #bar -> 2 } asDictionary.
	options at: #foo put: -1.
	self assert: options allBindings equals: { #foo -> -1. #bar -> 2 } asDictionary.
	options := options clone.
	options at: #bar put: -2.
	self assert: options allBindings equals: { #foo -> -1. #bar -> -2 } asDictionary.