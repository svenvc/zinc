private
characterCountFor: bytes
	| n characterCount |
	"This assumes that padding is used"
	n := bytes size.
	characterCount := (n // 3 + (n \\ 3) sign) * 4.
	^ lineLength
		ifNil: [ characterCount ]
		ifNotNil: [ characterCount + (characterCount // lineLength * lineEnd size) ]