public
getUserinfo
	| response |

	self scopesIncludeUserinfo 
		ifFalse: [ self error: 'Scopes must include userinfo.email or userinfo.profile' ].

	response := ZnClient new 
		systemPolicy;
		beOneShot;
		url: 'https://www.googleapis.com/oauth2/v3/userinfo';
		queryAt: 'access_token' put: self liveAccessToken;
		get.
	^ NeoJSONObject fromString: response