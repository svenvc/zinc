resources
newCalculator

	^ ZnOAuth1AuthorizationCalculator new
		consumerKey: self consumer ;
		consumerSecret: self consumerSecret ;
		yourself