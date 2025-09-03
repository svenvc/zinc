accessing
allBindings
	| bindings |
	bindings := Dictionary new.
	parent ifNotNil: [
		parent allBindings keysAndValuesDo: [ :key :value |
			bindings at: key put: value ] ].
	options ifNotNil: [
		options keysAndValuesDo: [ :key :value |
			bindings at: key put: value ] ].
	^ bindings