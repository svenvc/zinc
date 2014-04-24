error handling
errorResponse: request code: code message: message
	| statusLine data |
	statusLine := ZnStatusLine code: code.
	(data := Dictionary new)
		at: 'method' put: request method;
		at: 'uri' put: request uri printString;
		at: 'status-code' put: statusLine code;
		at: 'status-message' put: statusLine reason;
		at: 'message' put: message.
	^ ZnResponse new
		statusLine: statusLine;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity with: (self toJson: data) type: ZnMimeType applicationJson);
		yourself