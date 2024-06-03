converting
exceptionSet: classNames
	^ classNames inject: ExceptionSet new into: [ :set :each |
		  (Smalltalk globals includesKey: each)
			  ifTrue: [
				  set
					  add: (Smalltalk at: each);
					  yourself ]
			  ifFalse: [ set ] ]