api
putFile: pathSegments data: entity
	| url response |
	url := ZnUrl fromString: 'https://api-content.dropbox.com/1/files_put/sandbox'.
	url addPathSegments: pathSegments.
	response := self oauth1Service httpPut: url with: entity using: self accessToken.
	^ NeoJSONReader fromString: response