initialization
forJsonREST
	"Configure me to be a JSON REST client.
	Install a JSON content reader and writer and accept application/json."

	| reader writer |
	reader := ZnUtils defaultJSONReader.
	writer := ZnUtils defaultJSONWriter.
	self
		accept: ZnMimeType applicationJson;
		contentReader: [ :entity | reader fromString: entity contents ];
		contentWriter: [ :data | ZnEntity json: (writer toString: data) ]