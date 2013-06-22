error handling
errorResponse: request code: code message: message
	| statusLine data json |
	statusLine := ZnStatusLine code: code.
	(data := Dictionary new)
		at: 'method' put: request method;
		at: 'uri' put: request uri printString;
		at: 'status-code' put: statusLine code;
		at: 'status-message' put: statusLine reason;
		at: 'message' put: message.
	json := String
		streamContents: [ :stream | 
			(NeoJSONWriter on: stream)
				prettyPrint: true;
				newLine: String crlf;
				nextPut: data.
			stream crlf ].
	^ ZnResponse new
		statusLine: statusLine;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity with: json type: ZnMimeType applicationJson);
		yourself