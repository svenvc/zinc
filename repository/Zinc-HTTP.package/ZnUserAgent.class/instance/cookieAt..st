accessing
cookieAt: aName
	"Answers the named cookie for the current request or nil if non exists."
	
	^ self session cookieJar cookieAt: aName forUrl: self request url