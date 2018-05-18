accessing
maxage
	^ attributes at: 'max-age' ifAbsent: [ nil ]