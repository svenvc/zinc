accessing
credentialsForUrl: urlObject
	^ self credentials values select: [ :cred | urlObject authority includesSubString: (cred domain) ]