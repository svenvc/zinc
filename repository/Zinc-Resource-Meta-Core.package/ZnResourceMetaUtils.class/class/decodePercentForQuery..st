converting
decodePercentForQuery: string
	^ ZnPercentEncoder new
		decodePlusAsSpace: true;
		urlAsIri: (ZnCurrentOptions at: #urlAsIri);
		decode: string