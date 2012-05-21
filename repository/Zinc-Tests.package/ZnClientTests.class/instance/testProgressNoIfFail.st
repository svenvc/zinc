testing
testProgressNoIfFail
	self 
		should: [ 
			ZnClient new
				beOneShot;
				signalProgress: true;
				ifFail: [ self fail ];
				get: 'http://zn.stfx.eu/zn/small.html' ] 
		raise: HTTPProgress
