testing
testGetPharoVersion
	| client lastBuildVersion |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	lastBuildVersion := (client := ZnClient new)
		beOneShot;
		get: 'https://ci.inria.fr/pharo/job/Pharo-2.0/lastSuccessfulBuild/api/xml?xpath=/*/description/text()'.
	self assert: client isSuccess.
	self assert: client response contentType equals: ZnMimeType textPlain.
	self assert: client response contentLength > 0.
	self assert: lastBuildVersion notNil.
	self assert: lastBuildVersion isString.
	self assert: lastBuildVersion size > 0