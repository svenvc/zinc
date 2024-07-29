public
handleRequest: incomingRequest
	"Ask our proxy block to transform a incoming ZnRequest copy into an outgoing ZnRequest"

	| outgoingRequest |
	outgoingRequest := self proxyBlock 
		cull: (self copyAndPrepareRequest: incomingRequest) 
		cull: self server.
	^ ZnClient new
		request: outgoingRequest;
		beOneShot;
		execute;
		response