testing - external
testIfFailWrongType
	| client |
	(client := self httpClient)
		beOneShot;
		accept: ZnMimeType imagePng;
		enforceAcceptContentType: true;
		url: self smallHtmlUrl;
		ifFail: [ :exception |
			^ self assert: (exception isKindOf: ZnUnexpectedContentType) ];
		get.
	self fail