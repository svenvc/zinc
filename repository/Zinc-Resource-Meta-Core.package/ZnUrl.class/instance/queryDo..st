accessing-query
queryDo: block
	self hasQuery ifTrue: [ 
		self query keysAndValuesDo: block ]