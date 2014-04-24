writing
writeOn: stream
	| writeStream |
	writeStream := ZnBivalentWriteStream on: stream.
	writeStream nextPutAll: self method; space.
	(ZnNetworkingUtils shouldProxyUrl: self uri)
		ifTrue: [ self uri printOn: writeStream ]  
		ifFalse: [ self uri printPathQueryFragmentOn: writeStream ].
	writeStream space; nextPutAll: self version; nextPutAll: String crlf 