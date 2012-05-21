private-protocol
method: aMethod for: urlObject headers: headerCollection data: dataEntity
	| limit |
	limit := self settings followRedirect ifTrue: [ self settings redirectLimit ] ifFalse: [ 0 ].
	^ self method: aMethod for: urlObject headers: headerCollection data: dataEntity limit: limit
	