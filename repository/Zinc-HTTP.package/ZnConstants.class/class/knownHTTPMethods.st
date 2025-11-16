accessing
knownHTTPMethods
	"Return a sensible list of know HTTP methods or verbs.
	Left here for historical backwards compatibility,
	as #allowedMethods is now a <znOption> used in the implementation"

	^ #(
		"Standard HTTP 1.1 Verbs"
		GET PUT POST DELETE HEAD
		TRACE OPTIONS CONNECT PATCH
		"WebDAV verbs"
		PROPFIND PROPPATCH MKCOL COPY MOVE LOCK UNLOCK)