private
generateInvalidCallbackRequest

	| html entity |

	html := String streamContents: [ :stream |
		stream
			nextPutAll: '<h3>Not a valid callback request</h3>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity