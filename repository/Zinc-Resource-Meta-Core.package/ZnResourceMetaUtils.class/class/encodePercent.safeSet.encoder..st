converting
encodePercent: string safeSet: safeSet encoder: encoder
	^ ZnPercentEncoder new
		characterEncoder: encoder;
		safeSet: (self perform: safeSet);
		urlAsIri: (ZnCurrentOptions at: #urlAsIri);
		encode: string