instance creation
defaultRequestHeaders
	^ self new
		at: 'User-Agent' put: (ZnCurrentOptions at: #userAgentString);
		at: 'Accept' put: '*/*';
		yourself