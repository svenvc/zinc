accessing
jsonRequest
	^ (self request contentType matches: ZnMimeType applicationJson)
		ifTrue: [
			self fromJson: self request contents ]
		ifFalse: [
			self error: 'JSON content expected' ]