converting
requestBodyFor: aZincRequest
	^ (aZincRequest method ~= #TRACE 
		and: [ aZincRequest hasEntity
			and: [ aZincRequest entity isEmpty not
				and: [ aZincRequest entity contentType ~= ZnMimeType applicationFormUrlEncoded
					and: [ aZincRequest entity contentType ~= ZnMimeType multiPartFormData ] ] ] ])
			ifTrue: [
				"Seaside wants to do its own text conversions"
				aZincRequest entity bytes asString ]
			ifFalse: [
				String new ]