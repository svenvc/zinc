I am ZnExampleSumRestCall.
I am a ZnAutoMatchedRestCall.

I handle REST requests for /sum

For a GET request, I accept numbers as path elements or as a query parameter.

	GET /sum/1/2/3
	GET /sum?numbers=1,2,3
	
For a POST requests, I accept a text/plain entity containing numbers.

	POST /sum '1,2,3'
	
To install me, try:

	ZnServer startDefaultOn: 1701.
	ZnServer default logToTranscript.

	ZnServer default delegate
		map: 'sum' 
		to: (ZnRestServerDelegate new 
				uriSpace: (ZnCallHierarchyRestUriSpace new 
								rootClass: ZnExampleSumRestCall;
								yourself); 
				yourself).
			
	ZnServer stopDefault.
	
Here are some example invocations:

	ZnClient new
		url: ZnServer default localUrl;
		addPathSegment: #sum;
		queryAt: #numbers put: '1,2,3'; 
		get.
		
	ZnClient new
		url: ZnServer default localUrl;
		addPathSegment: #sum;
		addPathSegment: '1';
		addPathSegment: '2';
		addPathSegment: '3';
		get.
		
	ZnClient new
		url: ZnServer default localUrl;
		addPathSegment: #sum;
		entity: (ZnEntity text: '1,2,3'); 
		post.