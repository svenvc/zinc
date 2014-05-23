*Zinc-Patch-HTTPSocket
httpGet: url args: queryArguments user: username passwd: password
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpGet: url args: queryArguments user: username passwd: password