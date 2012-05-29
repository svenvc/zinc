private
systemVersionInfo
	| versionReport |
	versionReport := System stoneVersionReport.
	^ String streamContents: [ :stream |
			stream 
				print: 'GemStone ', (versionReport at: 'gsRelease'), ' of ', (versionReport at: 'gsBuildDate'), ' build ', (versionReport at: 'gsBuildSerialNum'); 
				nextPutAll: ' - '; 
				nextPutAll: ZnConstants defaultServerString ]
	