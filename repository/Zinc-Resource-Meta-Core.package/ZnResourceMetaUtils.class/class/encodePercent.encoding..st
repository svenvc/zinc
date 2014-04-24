conversions
encodePercent: string encoding: encoding
	^ self encodePercent: string safeSet: #rfc3986SafeSet encoding: 'utf-8'