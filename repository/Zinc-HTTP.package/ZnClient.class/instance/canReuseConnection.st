private
canReuseConnection
	self isConnected ifFalse: [ ^ false ].
	lastUsed ifNil: [ ^ false ].
	^ TimeStamp now - lastUsed < self connectionReuseTimeout seconds
	