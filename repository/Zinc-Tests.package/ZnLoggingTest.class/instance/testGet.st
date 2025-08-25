tests
testGet
	ZnServer withOSAssignedPortDo: [ :server |
		ZnClient new
			systemPolicy;
			url: server localUrl / #small;
			get ].
	self assert: logEventCollection notEmpty