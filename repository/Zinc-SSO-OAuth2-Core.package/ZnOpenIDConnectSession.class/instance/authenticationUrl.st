public
authenticationUrl

	authenticationState := self secureRandomString.
	^self authenticationUrlWithState: authenticationState.