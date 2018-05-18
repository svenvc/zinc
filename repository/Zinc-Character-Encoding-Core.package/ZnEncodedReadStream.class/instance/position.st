accessing
position

	^ super position - (peeked ifNil: [ 0 ] ifNotNil: [ 1 ])