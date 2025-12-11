testing
testUp
	self withServerDo: [ :server | | client |
		client := ZnClient new 
			beOneShot;
			get: server localUrl / 'up';
			yourself.
		self assert: client isSuccess.
		self assert: client response contentType equals: ZnMimeType textPlain ]