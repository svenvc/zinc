private
encodePath: string on: stream
	"Percent encode string on stream using a safe set specific to path elements"

	stream nextPutAll: (ZnResourceMetaUtils encodePercent: string safeSet: #urlPathSafeSet encoder: ZnDefaultCharacterEncoder value)