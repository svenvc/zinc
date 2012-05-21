private
extendHeaders: headers with: object 
	(object isNil or: [ object isEmpty ]) ifTrue: [ ^ headers ].
	object isString 
		ifTrue: [ headers addAll: (ZnHeaders readFrom: object readStream) ] 
		ifFalse: [ headers withAll: object ].
	^ headers
	
