private
postProcessResponse: response
	lastUsed := TimeStamp now.
	response isConnectionClose
		ifTrue: [ self close ]