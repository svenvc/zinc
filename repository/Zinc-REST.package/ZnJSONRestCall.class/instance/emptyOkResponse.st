public
emptyOkResponse
	| entity |
	entity := ZnEntity with: (self toJson: #OK) , String crlf type: ZnMimeType applicationJson.
	^ response := ZnResponse ok: entity