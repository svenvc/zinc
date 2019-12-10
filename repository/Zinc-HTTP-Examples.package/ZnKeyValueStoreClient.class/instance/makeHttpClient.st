private
makeHttpClient
	^ ZnClient new
		url: 'http://localhost:1701/kvstore';
		accept: ZnMimeType textPlain;
		enforceAcceptContentType: true;
		enforceHttpSuccess: true;
		autoResetEntityMethods: #(#HEAD #DELETE #GET);
		contentWriter: [ :data | ZnEntity text: data ];
		yourself