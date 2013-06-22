accessing
jsonResponse: data
	| json |
	json := String
		streamContents: [ :stream | 
			(NeoJSONWriter on: stream)
				prettyPrint: true;
				newLine: String crlf;
				nextPut: data.
			stream crlf ].
	self response: (ZnResponse ok: (ZnEntity with: json type: ZnMimeType applicationJson))