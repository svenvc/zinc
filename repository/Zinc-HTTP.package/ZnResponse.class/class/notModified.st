instance creation
notModified
	^ self new
		statusLine: ZnStatusLine notModified;
		headers: ZnHeaders defaultResponseHeaders;
		yourself