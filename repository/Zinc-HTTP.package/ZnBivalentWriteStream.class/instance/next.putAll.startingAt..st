accessing
next: count putAll: collection startingAt: offset
	| buffer |
	self isBinary
		ifTrue: [ 
			(collection isKindOf: ByteArray)
				ifTrue: [ stream next: count putAll: collection startingAt: offset ]
				ifFalse: [ 
					buffer := ByteArray new: count.
					buffer replaceFrom: 1 to: count with: collection asByteArray startingAt: offset.
					stream nextPutAll: buffer ] ]
		ifFalse: [ 
			(collection isKindOf: ByteArray)
				ifTrue: [ 
					buffer := String new: count.
					buffer replaceFrom: 1 to: count with: collection asString startingAt: offset.
					stream nextPutAll: buffer ]
				ifFalse: [ stream next: count putAll: collection startingAt: offset ] ]