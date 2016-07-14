public
created: uri
	^ (super created: uri)
		entity: (ZnEntity with: (self toJson: uri), String crlf type: ZnMimeType applicationJson);
		yourself