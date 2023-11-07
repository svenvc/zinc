accessing
encoder: anEncoding
	(encoder isNotNil and: [ anEncoding ~= encoder ]) ifTrue: [ self invalidateContentLength ].
	encoder := anEncoding