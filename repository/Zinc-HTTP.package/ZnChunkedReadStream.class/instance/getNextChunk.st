private
getNextChunk
	| size |
	(size := self getNextChunkSize) = 0
		ifTrue: [
			atEnd := true.
			chunk := position := limit := nil.
			self getExtraHeaders ]
		ifFalse: [
			totalSize := totalSize + size.
			self ensureChunkBufferOfSize: size.  
			stream next: size into: chunk.
			stream next: 2. "consume CRLF"
			limit := size.
			position := 0 ]