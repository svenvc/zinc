accessing attribute exchange
axValueCountry
	^self axPropertyAt: 'value.country' ifAbsent: [ nil ]
	