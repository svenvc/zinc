running
setUp
	server := ZnServer startOn: 1700 + 10 atRandom.
	server delegate: 
		(ZnRestServerDelegate new 
			uriSpace: (ZnCallHierarchyRestUriSpace new 
							rootClass: ZnExampleSumRestCall;
							yourself); 
			yourself).
	client := ZnClient new
		url: server localUrl;
		addPathSegment: #sum;
		yourself