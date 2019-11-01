testing
isLive
	"Answer if I have a access token that is not expired, or else, a valid refresh token to refresh my access token."
	^ self accessToken isNotNil and: [
		self isExpired not or: [
			self refreshToken isNotNil ] ]