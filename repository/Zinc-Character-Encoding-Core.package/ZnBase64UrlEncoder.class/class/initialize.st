class initialization
initialize

	DefaultAlphabet2 := String withAll: ($A to: $Z) , ($a to: $z) , ($0 to: $9) , #($- $_).
	DefaultInverse2 := Array new: 128.
	0 to: 127 do: [ :each | 
		| offset |
		offset := DefaultAlphabet2 indexOf: each asCharacter ifAbsent: [ nil ].
		DefaultInverse2 at: each + 1 put: (offset ifNotNil: [ offset - 1 ]) ]