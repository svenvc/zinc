twitter-api
getFriendsTimeline

	| url response json |

	url := ZnUrl fromString: 'http://api.twitter.com/1/statuses/friends_timeline.json'.
		
	response := (self oauth1Service httpGet: url using: self accessToken) asString.
	json := NeoJSONReader fromString: response.
	
	^json
