*Zinc-Patch-HTTPSocket
httpGet: url args: queryArguments accept: mimeType
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpGet: url args: queryArguments accept: mimeType 