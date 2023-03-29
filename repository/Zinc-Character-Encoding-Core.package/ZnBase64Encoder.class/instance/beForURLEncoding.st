initialization
beForURLEncoding
	"Configure me for 'base64url' encoding, used for filenames and URLs.
	In particular I am using $- instead of $+ and $_ instead of $/
	with no padding, line breaking or whitespace allowed.
	See https://tools.ietf.org/html/rfc4648#section-5.
	See https://en.wikipedia.org/wiki/Base64#URL_applications"

	self standardAlphabetWith: $- and: $_.
	self noPadding.
	self beLenient.
	self whitespace: nil