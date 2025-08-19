operations
writeNetscapeFormatTo: fileReference
	fileReference writeStreamDo: [ :fileStream |
		(ZnNewLineWriterStream on: fileStream) in: [ :out |
			out nextPutAll: '# Netscape HTTP Cookie File'; cr.
			self cookies do: [ :each |
				out nextPutAll: each netscapeString; cr ] ] ]