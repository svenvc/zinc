private
readRequestExceptionSet
	"Return the set of exception which, when they occur while reading a request,
	are interpreted as equivalent to a timeout or connection close."

	^ self
		exceptionSet:
			#(#ConnectionClosed #ConnectionTimedOut #PrimitiveFailed #ZnParseError #ZnCharacterEncodingError #ZnUnknownScheme #ZnPortNotANumber #ZnTooManyDictionaryEntries #ZnEntityTooLarge)