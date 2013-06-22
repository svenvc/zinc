conversions
parseQueryFrom: stream
	| string index fields |
	fields := ZnMultiValueDictionary new.
	[ stream atEnd ] whileFalse: [
		string := stream upTo: $&.
		index := string indexOf: $=.
		index > 0
			ifFalse: [ fields at: (self decodePercent: string) put: nil ]
			ifTrue: [
				fields
					at: (self decodePercent: (string copyFrom: 1 to: index - 1))
					add: (self decodePercent: (string copyFrom: index + 1 to: string size)) ] ].
	^ fields