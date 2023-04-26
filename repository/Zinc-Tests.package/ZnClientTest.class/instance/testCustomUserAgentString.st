testing
testCustomUserAgentString
	self withServerDo: [ :server | | client |
		"change ZnClient's local options"
		(client := ZnClient new)
			withOptions: [ :options |
				options at: #userAgentString put: 'foobar client' ];
			url: server localUrl;
			addPathSegment: #echo;
			get;
			close.
		self assert: (client contents includesSubstring: 'foobar client').
		"dynamically change an option starting from the global default"
		ZnOptions globalDefault clone
			at: #userAgentString put: 'foobar client';
			during: [
				(client := ZnClient new)
					url: server localUrl;
					addPathSegment: #echo;
					get;
					close.
				self assert: (client contents includesSubstring: 'foobar client') ].
		"dynamically change an option starting from the local options"
		client := ZnClient new.
		client localOptions clone
			at: #userAgentString put: 'foobar client';
			during: [
				(client := ZnClient new)
					url: server localUrl;
					addPathSegment: #echo;
					get;
					close.
				self assert: (client contents includesSubstring: 'foobar client') ].
		 ]