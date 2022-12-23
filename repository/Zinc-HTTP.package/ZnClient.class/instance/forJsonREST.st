initialization
forJsonREST

	| reader writer |
	reader := ZnUtils defaultJSONReader.
	writer := ZnUtils defaultJSONWriter.
	self
		accept: ZnMimeType applicationJson;
		contentReader: [ :entity | reader fromString: entity contents ];
		contentWriter: [ :data | ZnEntity json: (writer toString: data) ]