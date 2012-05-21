testing
testTooManyEntries
	| dictionary |
	dictionary := ZnMultiValueDictionary new.
	self
		should: [ 1 to: ZnConstants maximumNumberOfDictionaryEntries + 1 do: [ :each | 
						dictionary at: each put: each ] ]
		raise: ZnTooManyDictionaryEntries