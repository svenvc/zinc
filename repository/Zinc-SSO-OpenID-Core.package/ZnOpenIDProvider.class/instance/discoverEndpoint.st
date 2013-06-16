actions
discoverEndpoint
	"XRDS (eXtensible Resource Descriptor Sequence) "

	| response |
	
	response := self httpClient
		url: self discoveryUrl ;
		accept: 'application/xrds+xml' ;
		get ;
		response.
	
	response isSuccess
		ifFalse: [ self error: 'Failed to retrieve endpoint for ', self printString ].
		
	^ ZnXRDService parseOPEndpointFromXrds: response contents