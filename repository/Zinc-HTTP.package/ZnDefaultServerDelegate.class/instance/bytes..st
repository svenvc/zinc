responses
bytes: request
	"Answer a number of bytes according to a fixed non random pattern as an application/octet-stream.
	Optionally take the size from the URI, as in /bytes/32 for 32 bytes, default to 64 bytes.
	A newline is added at the end."

	| count byteArray |
	count := Integer readFrom: request uri lastPathSegment ifFail: [ 64 ].
	byteArray := ByteArray new: count.
	1 to: count - 1 do: [ :each |
		byteArray at: each put: (#(65 66 67 68) at: (each \\ 4 + 1)) ].
	byteArray at: count put: 10.
	^ ZnResponse ok: (ZnEntity bytes: byteArray)