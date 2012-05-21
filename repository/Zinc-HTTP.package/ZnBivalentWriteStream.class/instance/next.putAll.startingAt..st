accessing
next: count putAll: collection startingAt: offset
	self isBinary
		ifTrue: [ stream next: count putAll: collection asByteArray startingAt: offset ]
		ifFalse: [ stream next: count putAll: collection asString startingAt: offset ]