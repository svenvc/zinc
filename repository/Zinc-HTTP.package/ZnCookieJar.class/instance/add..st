as yet unclassified
add: aCookie
	(self removeIfExpired: aCookie) ifTrue: [^nil].
	self cookies copy do: [:cookie|
		cookie = aCookie ifTrue: [ self cookies remove: cookie]].
	self cookies add: aCookie
	