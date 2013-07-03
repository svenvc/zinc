initialize-release
endPoint: host
	"Initialize me to talk to the endpoint named host.
	Create a new HTTP client if needed, else reuse the existing one.
	Install my signatureTool as a prepare request hook."

	httpClient
		ifNil: [ 
			httpClient := ZnClient new
				http;
				prepareRequest: signatureTool;
				yourself ].
	httpClient host: host