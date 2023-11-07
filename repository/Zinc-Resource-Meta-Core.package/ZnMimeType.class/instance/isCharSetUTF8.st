testing
isCharSetUTF8
	^ self charSet isNotNil and: [ self charSet sameAs: 'utf-8' ]