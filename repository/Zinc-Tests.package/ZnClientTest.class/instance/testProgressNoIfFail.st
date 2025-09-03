testing - external
testProgressNoIfFail
	self
		should: [
			self httpClient
				beOneShot;
				signalProgress: true;
				ifFail: [ self fail ];
				get: self smallHtmlUrl ]
		raise: HTTPProgress