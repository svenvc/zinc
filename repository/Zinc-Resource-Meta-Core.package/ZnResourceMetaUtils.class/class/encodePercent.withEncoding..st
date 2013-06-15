conversions
encodePercent: string withEncoding: encoding
	^ ZnPercentEncoder new
		characterEncoder: (ZnCharacterEncoder newForEncoding: encoding);
		encode: string