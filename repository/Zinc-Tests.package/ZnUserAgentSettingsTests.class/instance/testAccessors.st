testing
testAccessors
	| settings |
	settings := ZnUserAgentSettings defaultSettingsClass new.
	self assert: (settings agent notNil).
	self assert: (settings followRedirect isKindOf: Boolean).
	self assert: (settings redirectLimit notNil).
	self assert: (settings timeout notNil)