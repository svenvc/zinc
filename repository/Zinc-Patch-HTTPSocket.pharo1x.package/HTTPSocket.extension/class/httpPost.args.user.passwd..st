*Zinc-Patch-HTTPSocket
httpPost: url args: arguments user: username passwd: password
	"Forward to Zinc HTTP Components"
	
	^ ZnHTTPSocketFacade httpPost: url args: arguments user: username passwd: password