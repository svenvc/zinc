accessing
jsonResponse: data
	| entity |
	entity := ZnEntity with: (self toJson: data) type: ZnMimeType applicationJson.
	self response: (ZnResponse ok: entity)