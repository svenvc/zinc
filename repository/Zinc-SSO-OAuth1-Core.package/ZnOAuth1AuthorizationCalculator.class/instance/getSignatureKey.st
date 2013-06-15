actions
getSignatureKey
	"Create the OAuth1 signature key. "

	| percentEncoder |

	percentEncoder := ZnPercentEncoder new.

	^String streamContents: [ :stream |
		percentEncoder encode: self consumerSecret readStream to: stream.
		stream nextPut: $&.
		percentEncoder encode: (self tokenSecret ifNil: [ '' ]) readStream to: stream ]