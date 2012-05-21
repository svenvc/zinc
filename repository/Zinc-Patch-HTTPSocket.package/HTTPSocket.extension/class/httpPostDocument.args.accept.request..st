*Zinc-Patch-HTTPSocket
httpPostDocument: url args: arguments accept: mimeType request: extraHeaders
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpPostDocument: url args: arguments accept: mimeType request: extraHeaders