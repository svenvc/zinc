private-protocol
prepareHeaders: headerCollection for: urlObject method: method
	| headers |
	headers := (ZnHeaders requestHeadersFor: urlObject)
					at: 'User-Agent' put: self settings agent;
					yourself.
	headerCollection isNil 
		ifFalse: [ headers addAll: headerCollection ].
	(self session cookieJar cookiesForUrl: urlObject) do: [ :cookie |
		headers at: 'Cookie' add: cookie nameValueString ].
	self prepareCredentials: headers for: urlObject method: method.
	^ headers
	