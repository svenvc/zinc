running
setUp

	super setUp.

	logEventCollection := OrderedCollection new.
	
	ZnLogEvent announcer
		when: ZnLogEvent
		do: [ :event | logEventCollection add: event ]
		for: self