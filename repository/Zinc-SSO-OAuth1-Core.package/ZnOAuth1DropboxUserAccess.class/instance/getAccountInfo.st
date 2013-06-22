api
getAccountInfo
	| url response json |

	url := ZnUrl fromString: 'https://api.dropbox.com/1/account/info'.
		
	response := self oauth1Service httpGet: url using: self accessToken.
	json := NeoJSONReader fromString: response.
	
	^ json
