public
getUserinfo

	| url client response |

	self scopesIncludeUserinfo
		ifFalse: [ self error: 'Scopes must include userinfo.email or userinfo.profile' ].

	url := (ZnUrl fromString: 'https://www.googleapis.com/oauth2/v3/userinfo')
		queryAt: 'access_token' put: self accessToken;
		yourself.

	client := ZnClient new.
	response := [ client get: url ]
		ensure: [ client close ].

	^ ZnUtils defaultJSONReader fromString: response