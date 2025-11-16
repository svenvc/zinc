private - protocol
redirectUrl
	"We support both absolute and relative locations (http://en.wikipedia.org/wiki/HTTP_location)"

	"Interpret the response location (the target of the redirect) relative to the original request's url.
	Note that if the response location is absolute, it will be used as is (see #withRelativeReference:)"

	^ request url withRelativeReference: response location