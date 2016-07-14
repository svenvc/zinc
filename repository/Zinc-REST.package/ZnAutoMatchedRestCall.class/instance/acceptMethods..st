public
acceptMethods: allowedMethods
	"Allow and execute allowedMethods (#put or #delete) as POST ? method=put"
	
	| method |
	method := (request uri queryAt: 'method' ifAbsent: [ #error ]) asLowercase asSymbol.
	(allowedMethods includes: method)
		ifTrue: [
			self perform: method ]
		ifFalse: [ 
			self wrongMethod ]    	