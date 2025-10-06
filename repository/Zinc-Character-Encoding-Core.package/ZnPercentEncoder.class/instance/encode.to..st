converting
encode: readStream to: writeStream
	self urlAsIri
		ifTrue: [ self encodeAsIri: readStream to: writeStream ]
		ifFalse: [ self encodeAsUrl: readStream to: writeStream ]