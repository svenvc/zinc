testing
testProgress
	"[ :bar |
		bar title: 'Downloading Sources...'.
		[
			ZnClient new 
				url: 'http://files.pharo.org/image/PharoV20.sources'; 
				signalProgress: true;	
				downloadTo: FileLocator temp ]
			on: HTTPProgress 
			do: [ :progress |
				progress isEmpty ifFalse: [ bar current: progress percentage ]. 
				progress resume ] ] asJob run."
		
	self 
		should: [ 
			ZnClient new
				beOneShot;
				signalProgress: true;
				get: 'http://zn.stfx.eu/zn/small.html' ] 
		raise: HTTPProgress
