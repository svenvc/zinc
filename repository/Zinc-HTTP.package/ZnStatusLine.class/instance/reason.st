accessing
reason
	reason isNil 
		ifTrue: [ 
			reason := ZnConstants httpStatusCodes at: self code ifAbsent: [ 'Unknown Status Code' ] ].
	^ reason