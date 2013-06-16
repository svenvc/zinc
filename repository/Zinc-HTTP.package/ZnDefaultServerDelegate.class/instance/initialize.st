initialize-release
initialize
	self
		map: 'welcome' to: #welcome:;
		map: 'help' to: #help:;
		map: 'echo' to: #echoRequest:;
		map: 'dw-bench' to: #dwbench:;
		map: 'favicon.ico' to: #favicon:;
		map: 'random' to: #random:;
		map: 'bytes' to: #bytes:;
		map: 'status' to: #status:;
		map: 'unicode' to: #unicode:;
		map: 'session' to: #sessionRequest:;
		map: 'error' to: #errorResponse:;
		map: '/' to: 'welcome'