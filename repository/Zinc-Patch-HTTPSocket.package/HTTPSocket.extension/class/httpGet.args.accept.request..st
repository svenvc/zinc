*Zinc-Patch-HTTPSocket
httpGet: url args: queryArguments accept: mimeType request: extraHeaders
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpGet: url args: queryArguments accept: mimeType request: extraHeaders 