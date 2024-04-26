private - protocol
executeWithRedirectsRemaining: redirectCount trail: collectionOfUrls
	self getConnectionAndExecute.
	response isRedirect
		ifTrue: [
			(redirectCount > 0 and: [ self followRedirects ])
				ifTrue: [
					self prepareRedirect.
					collectionOfUrls add: self request url.
					self 
						executeWithRedirectsRemaining: redirectCount - 1 
						trail: collectionOfUrls ]
				ifFalse: [
					self followRedirects
						ifTrue: [ | exception |
							(exception := ZnTooManyRedirects new) 
									trail: collectionOfUrls. 
							exception signal = exception defaultResumeValue
								ifTrue: [
									"when resumed with default resume value, start over"
									self 
										executeWithRedirectsRemaining: self maxNumberOfRedirects 
										trail: collectionOfUrls ] ] ] ].
	^ self handleResponse