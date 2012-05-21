accessing
stream
	^ stream ifNil: [
		(stream := FileStream stdout)
			wantsLineEndConversion: true;
			converter; "Force lazy initialization of converter"
			yourself ]