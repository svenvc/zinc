testing
isBinary

	^ binary ifNil: [ stream isBinary ] ifNotNil: [ binary ]