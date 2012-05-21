initialize-release
initialize
	(prefixMap := Dictionary new)
		at: 'welcome' put: #welcome:;
		at: 'help' put: #help:;
		at: 'echo' put: #echoRequest:;
		at: 'dw-bench' put: #dwbench:;
		at: 'favicon.ico' put: #favicon:;
		at: 'random' put: #random:;
		at: 'bytes' put: #bytes:;
		at: 'status' put: #status:;
		at: 'unicode' put: #unicode:;
		at: '/' put: 'welcome'