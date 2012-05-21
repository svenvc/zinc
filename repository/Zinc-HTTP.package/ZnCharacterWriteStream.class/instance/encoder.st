as yet unclassified
encoder
	^ encoder ifNil: [ encoder := self class defaultEncoder ]