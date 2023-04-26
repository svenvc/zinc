public
handleRequest: znRequest
	"try to resolve the uri path into a file for response. If not found dispatch the
	request to the given delegate"
	| response |
	(znRequest method = 'GET')
		ifTrue: [
			response := (staticDelegate handleRequest: znRequest).
			response isSuccess ifTrue: [
				^ response  ] ].
	^ delegate handleRequest: znRequest