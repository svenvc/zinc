accessing
settings
	^ settings isNil ifTrue: [ settings := Dictionary new ] ifFalse: [ settings ]