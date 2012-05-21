testing
testRedirect
	| client response |
	client := ZnClient new url: 'http://www.pharo-project.org'.
	self assert: (client get; isSuccess).
	client 
		close;
		maxNumberOfRedirects: 0;
		url: 'http://www.pharo-project.org'.
	self should: [ client get ] raise: ZnTooManyRedirects.
	client close.
	response := [ ZnClient new beOneShot; maxNumberOfRedirects: 0; get: 'http://www.pharo-project.org'; response ]
		on: ZnTooManyRedirects do: [ :exception | exception resume ].
	self assert: response isRedirect 