testing
testClassDefaults
	self assert: (ZnUserAgentSettings defaultCookieJar new isKindOf: ZnCookieJar).
	self assert: (ZnUserAgentSettings defaultSessionClass new isKindOf: ZnUserAgentSession).
	self assert: (ZnUserAgentSettings defaultSettingsClass new isKindOf: ZnUserAgentSettings)