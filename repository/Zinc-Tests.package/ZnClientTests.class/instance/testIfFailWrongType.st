testing
testIfFailWrongType
	| client |
	(client := ZnClient new)
		beOneShot;
		accept: ZnMimeType imagePng;
		enforceAcceptContentType: true;
		url: 'http://zn.stfx.eu/zn/small.html';
		ifFail: [ :exception |
			^ self assert: (exception isKindOf: ZnUnexpectedContentType) ];
		get.
	self fail