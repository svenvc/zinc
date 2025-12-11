testing
testStatus
	self withServerDo: [ :server | | client |
		client := ZnClient new 
			beOneShot; 
			get: server localUrl / 'status'; 
			yourself.
		self assert: client isSuccess.
		self assert: client response contentType equals: ZnMimeType textHtml ]