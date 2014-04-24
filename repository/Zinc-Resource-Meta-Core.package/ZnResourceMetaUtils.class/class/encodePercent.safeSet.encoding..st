conversions
encodePercent: string safeSet: safeSet encoding: encoding
	^ ZnPercentEncoder new
		characterEncoder: (ZnCharacterEncoder newForEncoding: encoding);
		safeSet: (self perform: safeSet);
		encode: string