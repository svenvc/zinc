tests
testParameterCase

	| mimeType |

	mimeType := ZnMimeType fromString: 'Content-type: multipart/mixed; Boundary="0__=4EBB090CDFA161078f9e8a93df938690918c4EBB090CDFA16107"'.
	self assert: (mimeType parameters includesKey: 'boundary')