public
getUserData
	| response |
	response := ZnClient new 
		systemPolicy;
		beOneShot;
		url: 'https://www.googleapis.com/oauth2/v3/userinfo';
		queryAt: 'access_token' put: self liveAccessToken;
		get.
	^ NeoJSONObject fromString: response