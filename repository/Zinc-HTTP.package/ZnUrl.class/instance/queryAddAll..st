accessing-query
queryAddAll: keyedCollection
	"Note that we use #at:add:"
	
	keyedCollection keysAndValuesDo: [ :key :value |
		self queryAt: key add: value ].
	^ keyedCollection 