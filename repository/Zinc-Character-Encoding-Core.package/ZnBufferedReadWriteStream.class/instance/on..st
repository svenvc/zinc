instance creation
on: aStream

	lastRead := true.
	readStream := ZnBufferedReadStream on: aStream.
	writeStream := ZnBufferedWriteStream on: aStream