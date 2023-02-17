initialize-release
readFrom: stream
	"Switch to streaming implementation later on"

	| bytes |

	"We have to use the contentLength instance variable instead of the accessor else a representation will be computed"
	contentLength
		ifNil: [ bytes := ZnUtils readUpToEnd: stream limit: ( ZnCurrentOptions at: #maximumEntitySize ) ]
		ifNotNil: [
			self contentLength > ( ZnCurrentOptions at: #maximumEntitySize ) ifTrue: [ ZnEntityTooLarge signal ].
			bytes := ByteArray ofSize: contentLength.
			stream next: contentLength into: bytes ].
	self parse: bytes boundary: self getBoundary asByteArray binary: false