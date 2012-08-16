accessing
eTag
	^ (self httpClient response 
			headers at: 'ETag' ifAbsent: [ ^ nil ]) withoutQuoting