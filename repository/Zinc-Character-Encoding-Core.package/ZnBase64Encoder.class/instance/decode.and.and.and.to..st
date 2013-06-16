private
decode: char1 and: char2 and: char3 and: char4 to: stream
	| v1 v2 v3 v4 |
	v1 := self valueForCharacter: char1.
	v2 := self valueForCharacter: char2.
	v3 := self valueForCharacter: char3.
	v4 := self valueForCharacter: char4.
	stream nextPut: (v1 << 2 bitXor: (v2 ifNil: [ 0 ]) >> 4).
	char3 ~= $=
		ifTrue: [ 
			stream nextPut: ((v2 bitAnd: 2r1111) << 4 bitXor: (v3 ifNil: [ 0 ]) >> 2).
			char4 ~= $=
				ifTrue: [ stream nextPut: ((v3 bitAnd: 2r11) << 6 bitXor: v4) ] ]