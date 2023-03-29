accessing
sslSessionClass
	^ sslSessionClass ifNil: [
		sslSessionClass := Smalltalk globals at: #ZdcPluginSSLSession ifAbsent: [ nil ] ]