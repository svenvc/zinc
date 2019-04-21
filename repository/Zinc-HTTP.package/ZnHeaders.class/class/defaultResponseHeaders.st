instance creation
defaultResponseHeaders
	^ self new
		at: 'Server' put: (ZnCurrentOptions at: #serverString);
		at: 'Date' put: ZnUtils httpDate;
		yourself