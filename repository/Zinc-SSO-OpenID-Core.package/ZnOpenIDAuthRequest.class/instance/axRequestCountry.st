accessing attribute exchange
axRequestCountry

	self
		nsAx: self class nsAttributeExchangeExtension;
		axMode: 'fetch_request';
		axTypeCountry: 'http://axschema.org/contact/country/home';
		axRequired: (self axRequired isNil
			ifTrue: [ '' ]
			ifFalse: [ self axRequired, ',']), 'country'