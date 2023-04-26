accessing
contents
	"Return a Dictionary containing the full contents of the key-value store of the server"

	| dictionary dump position |
	dictionary := Dictionary new.
	dump := self httpClient get: 'kvstore'.
	(dump includes: $=) ifFalse: [ ^ dictionary ].
	dump lines do: [ :each |
		position := each indexOf: $=.
		dictionary
			at: (each copyFrom: 1 to: position -1)
			put: (each copyFrom: position + 1 to: each size) ].
	^ dictionary