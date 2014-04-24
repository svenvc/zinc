utils
toJson: data
	^ String streamContents: [ :stream | 
			(NeoJSONWriter on: stream)
				prettyPrint: true;
				newLine: String crlf;
				asciiOnly: true;
				nextPut: data.
			stream crlf ]