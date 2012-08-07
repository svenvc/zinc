accessing
stream
	^ stream ifNil: [
		(stream := FileStream stdout)
			yourself ]