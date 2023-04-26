converting
decodePercentForQuery: string
	^ ZnPercentEncoder new
		decodePlusAsSpace: true;
		decode: string