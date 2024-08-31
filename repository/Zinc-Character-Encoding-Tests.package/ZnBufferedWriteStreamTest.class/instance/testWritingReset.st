tests
testWritingReset

	| file writeStream readStream |
	file := 'test.txt' asFileReference ensureCreateFile.

	writeStream := file binaryWriteStream.
	writeStream nextPutAll: 'pedro'.
	writeStream reset.
	writeStream nextPutAll: 'pha'.
	writeStream close.

	readStream := file readStream.
	self assert: readStream contents equals: 'pharo'