tests
testLogging

	| client logEventCollection count renderedLogEvents |
	logEventCollection := OrderedCollection new.
	ZnLogEvent announcer
		when: ZnLogEvent
		do: [ :event | logEventCollection add: event ]
		for: self.
	self withServerDo: [ :server |
		1 to: 3 do: [ :logLevel |
			server
				serverId: 'S' , logLevel asString;
				logLevel: logLevel.
			client := ZnClient new.
			client
				clientId: 'C' , logLevel asString;
				logLevel: logLevel.
			client get: (server localUrl addPathSegment: #small).
			self assert: client isSuccess.
			client get: (server localUrl addPathSegment: #error).
			self deny: client isSuccess.
			server delegate
				map: #redirect
				to: [ :request | ZnResponse redirect: #welcome ].
			client get: (server localUrl addPathSegment: #redirect).
			self assert: client isSuccess.
			client close ] ].
	count := ZnLogEvent announcer numberOfSubscriptions.
	ZnLogEvent announcer unsubscribe: self.
	self
		assert: ZnLogEvent announcer numberOfSubscriptions
		equals: count - 1.
	self deny: logEventCollection isEmpty.
	renderedLogEvents := String streamContents: [ :out |
		                     logEventCollection do: [ :event |
			                     out
				                     print: event;
				                     cr ] ].
	self deny: renderedLogEvents isEmpty