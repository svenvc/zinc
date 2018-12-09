ZnWebWorkspaceDelegate implements the http://ws.stfx.eu shared workspaces web service.

(ZnServer defaultOn: 1701)
	delegate: (ZnWebWorkspaceDelegate new endpoint: 'http://localhost:1701'; yourself);
	logToTranscript;
	start.
	
ZnEasy get: 'http://localhost:1701/1WS4U'
ZnEasy get: 'http://localhost:1701/1WS4U?format=text'
ZnEasy get: 'http://localhost:1701/1WS4U?format=html'

ZnEasy 
	post: 'http://localhost:1701' 
	data: (ZnEntity text: '123 factorial.\3 timesRepeat: [ Smalltalk garbageCollect ]\' withCRs).
