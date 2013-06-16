accessing attribute exchange
axRequestNames

	self
		nsAx: self class nsAttributeExchangeExtension;
		axMode: 'fetch_request';
		axTypeFirstname: 'http://axschema.org/namePerson/first';
		axTypeLastname: 'http://axschema.org/namePerson/last';
		axRequired: (self axRequired isNil
			ifTrue: [ '' ]
			ifFalse: [ self axRequired, ',']), 'firstname,lastname'