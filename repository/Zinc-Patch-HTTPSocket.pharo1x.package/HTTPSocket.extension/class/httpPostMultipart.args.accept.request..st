*Zinc-Patch-HTTPSocket
httpPostMultipart: url args: arguments accept: mimeType request: extraHeaders
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpPostMultipart: url args: arguments accept: mimeType request: extraHeaders