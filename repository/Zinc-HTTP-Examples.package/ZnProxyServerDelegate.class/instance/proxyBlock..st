accessing
proxyBlock: aBlock
	"Set the block that transforms a copy of the incoming ZnRequest to the outgoing ZnRequest.
	Two parameters are passed to block: the request and an optional server reference.
	See #copyAndPrepareRequest: for how the request got changed."

	proxyBlock := aBlock