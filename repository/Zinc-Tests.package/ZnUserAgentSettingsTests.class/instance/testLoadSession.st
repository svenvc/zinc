testing
testLoadSession
	| settings |
	settings := ZnUserAgentSettings defaultSettingsClass new.
	self assert: (settings loadSession isKindOf: ZnUserAgentSession)