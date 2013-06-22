twitter-api
statusesUpdate: aString
	"https://dev.twitter.com/docs/api/1.1/post/statuses/update"

	| request response json |

	request := ZnRequest post: 'https://api.twitter.com/1.1/statuses/update.json'.
	request entity: (ZnApplicationFormUrlEncodedEntity new
		at: 'status' put: aString ;
		yourself).
		
	response := self oauth1Service executeRequest: request token: self accessToken.
	response isSuccess 
		ifFalse: [ self error: 'Post failed: ', response contents printString ].

	json := NeoJSONReader fromString: response contents.
	
	^json
