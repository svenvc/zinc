accessing
urlPathSafeSet
	"See RFC 3986 section 3.3. The safe set for the path consists of
	the basic safe set #rfc3986SafeSet plus the 'sub-delimiters' !$&''()*+,;= plus : and @"

	^ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.~!$&''()*+,;=:@'