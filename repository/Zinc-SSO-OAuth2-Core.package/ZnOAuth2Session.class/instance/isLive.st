testing
isLive
	"Answer if I have a access token that is not expired, or else, a valid refresh token to refresh my access token."
	^ (self hasAccessToken and: [ self isNotExpired ]) 
		or: [ self hasRefreshToken ]