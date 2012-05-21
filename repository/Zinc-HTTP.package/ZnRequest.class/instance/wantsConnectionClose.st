testing
wantsConnectionClose
	^ self isConnectionClose 
		or: [ self isHttp10 and: [ self isConnectionKeepAlive not ] ]