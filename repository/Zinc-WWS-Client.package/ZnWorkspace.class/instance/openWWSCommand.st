window menu
openWWSCommand
	| userWarned |
	userWarned := true.
	(url isNil and: [ self contents isEmpty not or: [self hasUnacceptedEdits ]])
		ifTrue: [ userWarned := self warnUser ].
	(url isNil not and: [self hasUnacceptedEdits])
		ifTrue: [ userWarned := self warnUser ].
	userWarned 
		ifTrue: [ | input |
			input := UIManager default request: 'URL or key' initialAnswer: '' title: 'http://ws.stfx.eu'. 
			self openUrl: input ]