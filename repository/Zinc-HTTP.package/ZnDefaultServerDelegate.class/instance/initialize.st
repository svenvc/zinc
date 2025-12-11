initialization
initialize
	super initialize.
	self
		map: 'welcome' to: #welcome:;
		map: 'help' to: #help:;
		map: 'echo' to: #echoRequest:;
		map: 'echo-html' to: #echoRequestHtml:;
		map: 'small' to: #small:;
		map: 'dw-bench' to: #dwbench:;
		map: 'favicon.ico' to: #favicon:;
		map: 'random' to: #random:;
		map: 'bytes' to: #bytes:;
		map: 'status' to: #status:;
		map: 'up' to: #up:;
		map: 'unicode' to: #unicode:;
		map: 'session' to: #sessionRequest:;
		map: 'error' to: #errorResponse:;
		map: 'form-test-1' to: #formTest1:;
		map: 'form-test-2' to: #formTest2:;
		map: 'form-test-3' to: #formTest3:;
		map: 'routes' to: #help:;
		map: '/' to: 'welcome'