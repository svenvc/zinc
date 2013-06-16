running
setUp
	server := ZnServer startOn: 1700 + 10 atRandom.
	server delegate: ZnExampleStorageRestServerDelegate new.
	client := ZnClient new
		url: server localUrl;
		addPathSegment: #storage;
		accept: ZnMimeType applicationJson;
		contentReader: [ :entity | entity ifNotNil: [ NeoJSONReader fromString: entity contents ] ];
		contentWriter: [ :object | ZnEntity with: (NeoJSONWriter toString: object) type: ZnMimeType applicationJson ];
		yourself