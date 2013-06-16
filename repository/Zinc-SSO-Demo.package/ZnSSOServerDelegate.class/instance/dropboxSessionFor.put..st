accessing-session
dropboxSessionFor: aRequest put: anObject

	^ aRequest session attributeAt: 'dropbox-session' put: anObject