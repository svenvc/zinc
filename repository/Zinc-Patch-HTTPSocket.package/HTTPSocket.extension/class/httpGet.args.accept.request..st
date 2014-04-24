*Zinc-Patch-HTTPSocket
httpGet: url args: queryArguments accept: mimeType request: extraHeaders
	"Forward to Zinc HTTP Components"
	
	self deprecated: 'Use ZnClient' on: ' 2012-10-03T18:02:49Z' in: 'Pharo 2.0'.
	
	^ ZnHTTPSocketFacade httpGet: url args: queryArguments accept: mimeType request: extraHeaders 