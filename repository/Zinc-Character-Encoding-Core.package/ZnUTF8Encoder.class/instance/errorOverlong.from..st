error handling
errorOverlong: codePoint from: stream
	^ self error: 'Overlong utf-8 encoding (non-shortest form)'