accessing
prefixForNamespace: aNamespace ifAbsent: aBlock

	| begin |
	
	begin := 'openid.ns.'.
	self properties keysAndValuesDo: [ :key :value |
		(aNamespace = value and: [ (key copyFrom: 1 to: begin size) = begin ])
			ifTrue: [ ^key copyFrom: begin size + 1 to: key size ]].
	^aBlock value