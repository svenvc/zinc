testing
isBinary
	"Answers whether the contents of a resource described by me 
	should be considered as binary instead of textual."
	
	| subTypes |
	self main = 'text' ifTrue: [ ^ false ].
	(self matches: self class applicationJson) ifTrue: [ ^ false ].
	self main = 'application' ifFalse: [ ^ true ].
	subTypes := self sub subStrings: '+-'.
	^ subTypes noneSatisfy: [ :each | 
		#('x-javascript' 'xml' 'json') includes: each ]