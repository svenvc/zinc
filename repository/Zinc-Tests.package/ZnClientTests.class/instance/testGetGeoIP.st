testing
testGetGeoIP
	| result client |
	result := (client := ZnClient new)
		systemPolicy;
		url: 'http://easy.t3-platform.net/rest/geo-ip';
		queryAt: 'address' put: '81.83.7.35';
		accept: ZnMimeType applicationJson;
		contentReader: [ :entity | | parserClass |
			parserClass := Smalltalk at: #JSJsonParser ifAbsent: [ ^ self ].
			parserClass parse: entity contents ];
		ifFail: [ ^ self fail ];
		get.
	self assert: result isDictionary.
	self assert: (result at: #country) = 'BE'.
	client close.