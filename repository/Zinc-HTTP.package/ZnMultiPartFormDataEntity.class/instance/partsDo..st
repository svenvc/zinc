enumerating
partsDo: block

	parts ifNil: [ ^ self ].
	parts do: block