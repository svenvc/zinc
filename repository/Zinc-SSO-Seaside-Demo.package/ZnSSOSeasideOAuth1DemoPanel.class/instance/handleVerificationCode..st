actions
handleVerificationCode: aCode
	"Try to get an access code using the user supplied verification code."

	aCode trimBoth isEmpty
		ifFalse: [
			self accessToken: (self oauthService getAccessToken: self requestToken verifier: aCode trimBoth) ]