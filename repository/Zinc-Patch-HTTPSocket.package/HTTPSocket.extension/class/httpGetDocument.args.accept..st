*Zinc-Patch-HTTPSocket
httpGetDocument: url args: queryArguments accept: mimeType
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpGetDocument: url args: queryArguments accept: mimeType