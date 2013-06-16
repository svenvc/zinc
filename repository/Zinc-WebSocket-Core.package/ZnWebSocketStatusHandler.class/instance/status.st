accessing
status
	^ String cr join: { 
		DateAndTime now printString. 
		self systemVersionInfo. 
		self vmStats. 
		self processes }
