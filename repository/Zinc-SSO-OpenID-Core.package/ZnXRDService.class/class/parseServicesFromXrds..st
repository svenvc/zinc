parsing
parseServicesFromXrds: aString

	| xrdElement elements document |

	document := self xmlParser parse: aString.
	xrdElement := document root elementAt: 'XRD'.
	elements := OrderedCollection new.
	xrdElement
		elementsAt: 'Service'
		do: [ :e | (self parseServiceElement: e) ifNotNil: [ :nonNilService | elements addAll: nonNilService ] ].
	^ elements