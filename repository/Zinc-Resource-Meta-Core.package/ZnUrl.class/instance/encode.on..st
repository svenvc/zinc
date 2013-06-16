private
encode: string on: stream
	stream nextPutAll: (ZnPercentEncoder new encode: string)