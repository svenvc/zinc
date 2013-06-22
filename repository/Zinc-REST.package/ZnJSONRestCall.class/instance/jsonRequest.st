accessing
jsonRequest
	^ self request contentType = ZnMimeType applicationJson
		ifTrue: [
			NeoJSONReader fromString: self request contents ]
		ifFalse: [
			self error: 'JSON content expected' ]