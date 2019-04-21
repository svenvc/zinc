private
characterCountFor: bytes
	| n characterCount | 
	"This assumes that padding is used"
	n := bytes size.
	characterCount := (n // 3 + (n \\ 3) sign) * 4.
	^ lineLength isNil
		ifTrue: [ characterCount ]
		ifFalse: [ characterCount + ((characterCount // lineLength ) * lineEnd size) ]