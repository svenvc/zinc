private
initializeByteTextConverters
	(ByteTextConverters := Dictionary new)
		at: 'cp-1250' put: CP1250TextConverter;
		at: 'cp-1253' put: CP1253TextConverter;
		at: 'iso-8859-2' put: ISO88592TextConverter; 
		at: 'latin-2' put: ISO88592TextConverter; 
		at: 'latin2' put: ISO88592TextConverter; 
		at: 'iso-8859-7' put: ISO88597TextConverter;
		at: 'iso-8859-15' put: ISO885915TextConverter
		