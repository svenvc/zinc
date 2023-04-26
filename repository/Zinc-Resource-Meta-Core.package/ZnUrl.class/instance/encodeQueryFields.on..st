private
encodeQueryFields: fields on: stream
	"Percent encode the key/value fields on stream, these constitute the query part"

	ZnResourceMetaUtils writeQueryFields: fields on: stream