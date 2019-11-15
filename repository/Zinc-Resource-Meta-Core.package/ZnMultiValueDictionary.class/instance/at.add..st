accessing
at: key add: value
	"Store value under key. If key already exists, store multiple values as Array"

	| existingValue newValue |

	existingValue := self at: key ifAbsent: [ nil ].
	newValue := existingValue
		ifNil: [ value ]
		ifNotNil: [ existingValue isArray
				ifTrue: [ ( existingValue includes: value )
						ifTrue: [ ^ value ].
					existingValue copyWith: value
					]
				ifFalse: [ existingValue = value
						ifTrue: [ ^ value ].
					Array with: existingValue with: value
					]
			].
	^ self at: key put: newValue