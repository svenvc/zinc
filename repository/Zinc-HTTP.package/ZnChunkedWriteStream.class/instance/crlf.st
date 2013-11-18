private
crlf
	stream nextPutAll: (self isBinary ifTrue: [ #(13 10) asByteArray ] ifFalse: [ String crlf ])