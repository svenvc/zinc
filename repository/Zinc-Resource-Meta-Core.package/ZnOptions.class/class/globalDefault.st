accessing
globalDefault
	^ globalDefault ifNil: [ globalDefault := self root clone ]