accessing attribute exchange
axValueEmail
	^self axPropertyAt: 'value.email' ifAbsent: [ nil ]
	