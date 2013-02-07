accessing-session
dropboxSessionFor: aRequest ifAbsent: aBlock

	^ aRequest session attributeAt: 'dropbox-session' ifAbsent: aBlock