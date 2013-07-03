initialize-release
initialize

	super initialize.
	
	scopes := OrderedCollection withAll: self class ssoScopes