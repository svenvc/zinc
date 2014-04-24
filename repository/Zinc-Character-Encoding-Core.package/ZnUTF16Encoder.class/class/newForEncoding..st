instance creation
newForEncoding: string
	"Return a new character encoder object for an encoding described by string.
	Try to infer endianness from string, defaulting to big endian."
	
	| encoder |
	encoder := self new.
	(string endsWith: 'be') ifTrue: [ encoder beBigEndian ].
	(string endsWith: 'le') ifTrue: [ encoder beLittleEndian ].
	^ encoder