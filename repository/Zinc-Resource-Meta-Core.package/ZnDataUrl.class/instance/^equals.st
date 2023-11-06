comparing
= anObject
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ mediaType = anObject mediaType and: [
		  base64Encoded = anObject isBase64Encoded and: [
			  data = anObject data ] ]