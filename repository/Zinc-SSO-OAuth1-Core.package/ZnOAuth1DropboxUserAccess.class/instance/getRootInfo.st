api
getRootInfo
	| url response json |

	url := ZnUrl fromString: 'https://api.dropbox.com/1/metadata/sandbox/'.
	url queryAt: #list put: #true.
		
	response := self oauth1Service httpGet: url using: self accessToken.
	json := NeoJSONReader fromString: response.
	
	^ json
