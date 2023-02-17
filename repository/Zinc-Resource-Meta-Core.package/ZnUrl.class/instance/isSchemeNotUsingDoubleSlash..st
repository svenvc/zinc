private
isSchemeNotUsingDoubleSlash: schemeString
	^ self class schemesNotUsingDoubleSlash , self class schemesOptionallyNotUsingDoubleSlash
		includes: schemeString asLowercase