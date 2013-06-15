accessing attribute exchange
axRequestLanguage

	self
		nsAx: self class nsAttributeExchangeExtension;
		axMode: 'fetch_request';
		axTypeLanguage: 'http://axschema.org/pref/language';
		axRequired: (self axRequired isNil
			ifTrue: [ '' ]
			ifFalse: [ self axRequired, ',']), 'language'