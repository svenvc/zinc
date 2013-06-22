protocol
unregister: clientWebSocket
	lock critical: [
		webSockets remove: clientWebSocket ifAbsent: [ ] ]