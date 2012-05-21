accessing
session
	^ session ifNil: [ session := self settings loadSession ]