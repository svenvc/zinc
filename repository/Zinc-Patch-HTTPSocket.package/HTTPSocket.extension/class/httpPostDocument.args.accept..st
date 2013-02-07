*Zinc-Patch-HTTPSocket
httpPostDocument: url args: arguments accept: mimeType
	"Forward to Zinc HTTP Components"
	
	self deprecated: 'Use ZnClient' on: ' 2012-10-03T18:02:49Z' in: 'Pharo 2.0'.
	
	^ ZnHTTPSocketFacade httpPostDocument: url args: arguments accept: mimeType