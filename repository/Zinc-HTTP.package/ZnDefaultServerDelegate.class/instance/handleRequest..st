public
handleRequest: request

	| prefix |

	prefix := request uri isSlash
		ifTrue: [ prefixMap at: '/' ifAbsent: [ nil ] ]
		ifFalse: [ request uri firstPathSegment ].
	^ prefixMap
		at: prefix
		ifPresent: [ :prefixHandler |
			prefixHandler isSymbol
				ifTrue: [ self perform: prefixHandler with: request ]
				ifFalse: [ prefixHandler value: request ]
			]
		ifAbsent: [ ZnResponse notFound: request uri ]