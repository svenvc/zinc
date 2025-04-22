utilities
definitionOf: key
	| implementors options |
	implementors := key implementors.
	options := implementors select: [ :method |
		method method pragmas
			anySatisfy: [ :pragma | pragma selector = #znOption ] ].
	options ifEmpty: [ self error: 'Not option definition found for ' , key printString ].
	options size > 1 ifTrue: [ self error: 'Multiple conflicting option definitions found for ' , key printString ].
	^ options first method