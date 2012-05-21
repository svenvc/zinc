accessing request
headerAddAll: keyedCollection
	self resetRequestIfNeeded.
	request headers 
		addAll: keyedCollection 