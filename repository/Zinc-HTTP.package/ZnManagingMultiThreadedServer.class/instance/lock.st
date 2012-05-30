accessing
lock
	^ lock ifNil: [ lock := TransientMutex new ]