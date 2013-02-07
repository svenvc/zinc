accessing attribute exchange
axValueLastname
	^self axPropertyAt: 'value.lastname' ifAbsent: [ nil ]
	