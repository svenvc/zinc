tests
testOrder
	| keys dictionary index |
	keys := #(z a y b x c m n).
	dictionary := ZnMultiValueDictionary new.
	keys do: [ :each | dictionary at: each put: each ].
	index := 1.
	dictionary keysDo: [ :each |
		self assert: each equals: (keys at: index).
		index := index + 1 ]