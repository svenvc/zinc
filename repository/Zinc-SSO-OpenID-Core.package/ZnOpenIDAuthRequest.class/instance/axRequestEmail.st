accessing attribute exchange
axRequestEmail

	self
		nsAx: self class nsAttributeExchangeExtension;
		axMode: 'fetch_request';
		axTypeEmail: 'http://axschema.org/contact/email';
		axRequired: (self axRequired isNil
			ifTrue: [ '' ]
			ifFalse: [ self axRequired, ',']), 'email'