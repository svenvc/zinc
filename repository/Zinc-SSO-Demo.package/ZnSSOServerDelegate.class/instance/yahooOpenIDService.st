accessing
yahooOpenIDService

	^ yahooOpenIDService ifNil: [ yahooOpenIDService := ZnOpenIDProvider newYahooProvider createSession ]