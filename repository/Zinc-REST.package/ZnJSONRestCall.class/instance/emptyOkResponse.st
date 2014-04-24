public
emptyOkResponse 
	^ response := ZnResponse ok: (ZnEntity with: (self toJson: #OK), String crlf type: ZnMimeType applicationJson)