options
queryKeyValueSafeSet
	"When encoding the key/value pairs of a URL or form-url-encoded entity,
	the characters part of this safe set are not percent encoded.
	Some servers expect more characters to be percent encoded, some less,
	in which case this option can be modified."

	<znOption>

	^ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.~!$''()*,;:@/?'

	"When a query is interpreted as a list of key=value&.. pairs,
	it is better to encode = and & and leave them out of the safe set.
	Furthermore, since + is interpreted as space in the query part,
	it is unsafe as well. This is a restriction of #querySafeSet"