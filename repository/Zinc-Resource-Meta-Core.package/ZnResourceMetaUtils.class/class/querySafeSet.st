accessing
querySafeSet
	"See RFC 3986 section 3.4. The safe set for the query part consists of
	the basic safe set #rfc3986SafeSet plus the 'sub-delimiters' !$&''()*+,;=
	plus : and @ plus / and ?"

	^ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.~!$&''()*+,;=:@/?'