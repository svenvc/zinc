private
redirectNeededFor: uri actualFilename: actualFilename
	uri isDirectory ifTrue: [ ^ false ].  
	^ (actualFilename endsWith: uri lastPathSegment) not