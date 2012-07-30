accessing
asUrl
	^ (ZnUrl new)
		scheme: #http;
		host: 's3.amazonaws.com';
		parseFrom: self asResource;
		yourself