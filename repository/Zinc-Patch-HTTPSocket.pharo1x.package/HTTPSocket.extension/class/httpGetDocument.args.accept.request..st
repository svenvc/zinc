*Zinc-Patch-HTTPSocket
httpGetDocument: url args: queryArguments accept: mimeType request: extraHeaders
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpGetDocument: url args: queryArguments accept: mimeType request: extraHeaders