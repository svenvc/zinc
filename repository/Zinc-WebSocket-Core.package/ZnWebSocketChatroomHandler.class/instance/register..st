protocol
register: clientWebSocket
	lock critical: [
		webSockets add: clientWebSocket ]