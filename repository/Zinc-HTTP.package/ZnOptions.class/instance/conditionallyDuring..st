execution
conditionallyDuring: block
	^ ZnCurrentOptions value
		ifNil: [ ZnCurrentOptions value: self during: block ]
		ifNotNil: block