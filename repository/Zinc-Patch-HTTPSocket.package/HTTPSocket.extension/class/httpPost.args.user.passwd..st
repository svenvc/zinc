*Zinc-Patch-HTTPSocket
httpPost: url args: arguments user: username passwd: password
	"Forward to Zinc HTTP Components"
	
	self deprecated: 'Use ZnClient' on: ' 2012-10-03T18:02:49Z' in: 'Pharo 2.0'.
	
	^ ZnHTTPSocketFacade httpPost: url args: arguments user: username passwd: password