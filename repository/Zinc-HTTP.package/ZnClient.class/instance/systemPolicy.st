initialization
systemPolicy
	"Configure me to fail when I don't receive an HTTP success respsone 
	or when the content type that I get back is not why I expected. 
	Set the number of retries to 2."

	self
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		numberOfRetries: 2