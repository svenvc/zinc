accessing
contentType
	| headerValue |
	headerValue := (self singleAt: 'Content-Type' ifAbsent: [ ^ ZnMimeType default ]) trimBoth.
	headerValue isEmpty ifTrue: [ ^ ZnMimeType default ].
	^ ZnMimeType fromString: headerValue