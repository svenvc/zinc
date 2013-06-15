accessing
googleOpenIDService

	^ googleOpenIDService ifNil: [ googleOpenIDService := ZnOpenIDProvider newGoogleProvider createSession ]