conversions
decodePercent: string
	^ [ string unescapePercents ]
		on: Error 
		do: [:ex |  (ZnPercentEncodingWrong string: string) signal ]