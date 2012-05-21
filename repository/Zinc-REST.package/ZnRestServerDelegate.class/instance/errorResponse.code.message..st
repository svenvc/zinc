error handling
errorResponse: request code: code message: message
	| statusLine text |
	statusLine := ZnStatusLine code: code.
	text := String streamContents: [ :stream | 
		stream << message; space; nextPut: $[; print: code; space; << statusLine reason; nextPut: $]; crlf ].
	^ ZnResponse new
		statusLine: statusLine;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity with: text);
		yourself