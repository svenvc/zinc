testing
testMultiValues
	| dictionary values keys |
	dictionary := ZnMultiValueDictionary new.
	dictionary
		at: 'foo' add: 1;
		at: 'foo' add: 2.
	self assert: (dictionary at: 'foo') equals: #(1 2).
	self assert: dictionary keys asArray equals: #('foo').
	values := OrderedCollection new.
	keys := OrderedCollection new.
	dictionary
		keysAndValuesDo: [ :key :value |
			keys add: key.
			values add: value ].
	self assert: values equals: (OrderedCollection with: 1 with: 2).
	self assert: keys equals: (OrderedCollection with: 'foo' with: 'foo')