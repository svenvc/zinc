utils
extractBasicAuthorization: request
	| authorization |
	authorization := (request headers at: 'Authorization' ifAbsent: [ ^ nil ]) findTokens: ' '.
	(authorization size = 2 and: [ authorization first = 'Basic' ]) ifFalse: [ ^ nil ].
	authorization :=  (ZnUtils decodeBase64: authorization second) findTokens: ':'.
	authorization size = 2 ifFalse: [ ^ nil ].
	^ authorization first -> authorization second
