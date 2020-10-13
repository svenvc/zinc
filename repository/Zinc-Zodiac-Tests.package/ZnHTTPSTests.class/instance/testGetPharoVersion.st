testing
testGetPharoVersion
	| imageVersion url client lastBuildVersion |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	self runningOnWindowsInriaCI ifTrue: [ ^ self ].
	imageVersion := SystemVersion current type , SystemVersion current dottedMajorMinor.
	url := ZnUrl new 
		scheme: #https;
		host: 'ci.inria.fr';
		addPathSegments: #('pharo-ci-jenkins2' 'job' 'Test pending pull request and branch Pipeline' 'job');
		addPathSegment: imageVersion;
		addPathSegments: #('api' 'xml');
		queryAt: 'xpath' add: '/*/fullDisplayName';
		yourself.
	lastBuildVersion := (client := ZnClient new)
		beOneShot;
		get: url.
	self assert: client isSuccess.
	self assert: (client response contentType matches: ZnMimeType applicationXml).
	self assert: client response contentLength > 0.
	self assert: lastBuildVersion notNil.
	self assert: lastBuildVersion isString.
	self deny: lastBuildVersion isEmpty.
	self assert: (lastBuildVersion includesSubstring: imageVersion).