twitter-api
accountVerifyCredentials
	"https://dev.twitter.com/docs/api/1.1/get/account/verify_credentials "

	| url response json |

	url := ZnUrl fromString: 'https://api.twitter.com/1.1/account/verify_credentials.json'.
		
	response := (self oauth1Service httpGet: url using: self accessToken) asString.
	json := NeoJSONReader fromString: response.
	
	^json
