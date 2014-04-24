private
validateAuthenticationState: aString

	self authenticationState = aString 
		ifFalse: [ self error: 'Invalid authentication state' ]