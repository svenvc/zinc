accessing
addAll: keyedCollection
	keyedCollection keysAndValuesDo: [ :key :value |
		self at: key put: value ].
	^ keyedCollection 