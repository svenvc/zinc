private
encode: string on: stream
	"Percent encode string on stream, using the smallest possible safe set.
	This is used for the host, username and password parts."

	stream nextPutAll: (ZnResourceMetaUtils encodePercent: string safeSet: #rfc3986SafeSet encoder: ZnDefaultCharacterEncoder value)