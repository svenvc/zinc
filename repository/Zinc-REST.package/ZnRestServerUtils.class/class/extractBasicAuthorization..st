utils
extractBasicAuthorization: request
	| authorization decodedCredentials indexOfColon |
	authorization := (request headers at: 'Authorization' ifAbsent: [ ^ nil ]) findTokens: ' '.
	(authorization size = 2 and: [ authorization first = 'Basic' ]) ifFalse: [ ^ nil ].
	decodedCredentials := ZnUtils decodeBase64: authorization second.
	indexOfColon := decodedCredentials indexOf: $: ifAbsent: [ ^ nil ].
	^ (decodedCredentials first: indexOfColon - 1) -> (decodedCredentials allButFirst: indexOfColon)
