public
handleRequest: request
	| handler relativeRequest |
	handler := self prefixDictionary
		at: request uri firstPathSegment
		ifAbsent: [ ^ ZnResponse notFound: request uri ].
	relativeRequest := request copy.
	relativeRequest uri removeFirstPathSegment.
	^ handler isBlock
		ifTrue: [ handler value: relativeRequest ]
		ifFalse: [ handler handleRequest: relativeRequest ]