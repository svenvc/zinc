testing
testProgress
	"UIManager default informUserDuring: [ :bar |
		[ ^ ZnClient new
				signalProgress: true;
				get: 'http://zn.stfx.eu/echo?delay=2' ]
			on: HTTPProgress 
			do: [ :progress | bar value: progress printString. progress resume ] ]"
		
	self 
		should: [ 
			ZnClient new
				beOneShot;
				signalProgress: true;
				get: 'http://zn.stfx.eu/zn/small.html' ] 
		raise: HTTPProgress
