testing
testLegacy
	| oldMIMEType |
	oldMIMEType := [ MIMEType defaultText ]
		on: Deprecation
		do: [ :notification | notification resume ].
	self assert: (oldMIMEType asZnMimeType matches: ZnMimeType textPlain)