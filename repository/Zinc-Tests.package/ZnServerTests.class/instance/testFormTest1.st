testing
testFormTest1
	| input client |
	input := '1+2=3 & 2+1=3 single '' double " - cool ?'.
	self withServerDo: [ :server |
		(client := ZnClient new)
			beOneShot;
			url: server localUrl;
			addPathSegment: 'form-test-1';
			queryAt: #input put: input;
			get.
		self assert: client isSuccess.
		self assert: (client contents includesSubstring: input) ]