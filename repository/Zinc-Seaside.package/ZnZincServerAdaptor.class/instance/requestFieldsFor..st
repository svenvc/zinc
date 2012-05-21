converting
requestFieldsFor: aZincRequest
	| fields |
	fields := WARequestFields new.
	(aZincRequest method = #POST and: [ aZincRequest hasEntity ])
		ifTrue: [ 
			aZincRequest entity contentType = ZnMimeType applicationFormUrlEncoded
				ifTrue: [
					fields addAll: aZincRequest entity fields ].
			aZincRequest entity contentType = ZnMimeType multiPartFormData
				ifTrue: [
					fields addAll: (self convertMultipart: aZincRequest entity) ] ].
	^ fields
	