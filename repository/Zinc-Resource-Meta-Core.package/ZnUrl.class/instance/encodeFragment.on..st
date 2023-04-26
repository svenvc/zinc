private
encodeFragment: string on: stream
	"Percent encode string, assumed to be a fragment, on stream using the query safe set."

	stream nextPutAll: (ZnResourceMetaUtils encodePercent: string safeSet: #querySafeSet encoder: ZnDefaultCharacterEncoder value)