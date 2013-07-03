accessing
at: key ifAbsent: block
	| fullPath |
	fullPath := self directory / (key first: 2) / key.
	fullPath exists
		ifFalse: [ ^ block value ].
	^ fullPath readStreamDo: [ :stream | 
			stream upToEnd ]