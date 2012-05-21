accessing
logEvents 
	^ logEvents ifNil: [ logEvents := OrderedCollection new ]