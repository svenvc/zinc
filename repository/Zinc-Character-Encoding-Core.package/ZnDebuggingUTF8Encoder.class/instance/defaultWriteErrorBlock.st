accessing
defaultWriteErrorBlock
	^ [ :codePoint | 
		'<Cannot utf-8 encode code point {1}>' format: { codePoint } ]