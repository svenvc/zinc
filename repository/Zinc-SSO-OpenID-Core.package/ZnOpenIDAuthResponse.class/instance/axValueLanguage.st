accessing attribute exchange
axValueLanguage
	^self axPropertyAt: 'value.language' ifAbsent: [ nil ]
	