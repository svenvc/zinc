api
getFile: pathSegments
	| url response |
	url := ZnUrl fromString: 'https://api-content.dropbox.com/1/files/sandbox'.
	url addPathSegments: pathSegments.
	response := self oauth1Service httpGet: url using: self accessToken.
	^ response