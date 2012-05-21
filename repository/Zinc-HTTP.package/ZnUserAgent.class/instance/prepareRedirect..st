private-protocol
prepareRedirect: headerCollection
	"We implement the common behavior that POST/PUT redirects turn into GET request.
	Note also that the body data is dropped"
	
	| method |
	(#(POST PUT) includes: request method)
		ifTrue: [ method := #GET ]
		ifFalse: [ method := self request method ].
	self prepareRequest: self redirectUrl method: method headers: headerCollection data: nil