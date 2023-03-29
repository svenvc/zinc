convenience
logToTranscript
	self stopLoggingToTranscript.
	^ self announcer when: ZnLogEvent do: [ :event | self crTrace: event ]