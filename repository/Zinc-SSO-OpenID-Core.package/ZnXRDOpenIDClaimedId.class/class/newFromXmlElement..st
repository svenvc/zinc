instance creation
newFromXmlElement: aXmlElement

	| opEndpoint localId |

	aXmlElement
		elementsAt: 'URI'
		do: [ :e | 
			opEndpoint
				ifNil: [ opEndpoint := e contentString ]
				ifNotNil: [ Error signal: 'Too many URI elements for OpenID Claimed Id' ] ].
	aXmlElement
		elementsAt: 'LocalID'
		do: [ :e | 
			localId
				ifNil: [ localId := e contentString ]
				ifNotNil: [ Error signal: 'Too many localIds elements for OpenID Claimed Id' ] ].
	^ self new
		localId: localId;
		opEndpoint: opEndpoint;
		yourself