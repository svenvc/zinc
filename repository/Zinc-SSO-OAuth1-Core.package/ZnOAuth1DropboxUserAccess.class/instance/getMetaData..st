api
getMetaData: pathSegments
	| url response |
	url := ZnUrl fromString: 'https://api.dropbox.com/1/metadata/sandbox'.
	url addPathSegments: pathSegments.
	url queryAt: #list put: #true.
	response := self oauth1Service httpGet: url using: self accessToken.
	^ NeoJSONReader fromString: response