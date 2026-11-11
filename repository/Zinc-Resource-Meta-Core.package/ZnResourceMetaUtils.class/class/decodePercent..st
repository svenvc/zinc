converting
decodePercent: string
	^ ZnPercentEncoder new
		decodePlusAsSpace: false;
		urlAsIri: (ZnCurrentOptions at: #urlAsIri);
		decode: string