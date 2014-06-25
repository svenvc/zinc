as yet unclassified
dataAvailable
	self isConnected ifFalse:[^false].
	^self readyForRead