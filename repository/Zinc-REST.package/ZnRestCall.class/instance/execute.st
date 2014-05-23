public
execute
	^ (self respondsTo: self method)	
		ifTrue: [ (self perform: self method) response ] 
		ifFalse: [ self delegate wrongMethod: request ]