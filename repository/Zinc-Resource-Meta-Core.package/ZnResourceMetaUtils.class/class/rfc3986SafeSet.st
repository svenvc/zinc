accessing
rfc3986SafeSet
	"Return the unreserved characters according to RFC 3986 section 2.3.
	This is the most narrow safe set to be used in a better safe than sorry approach."

	^ ZnPercentEncoder rfc3986UnreservedCharacters