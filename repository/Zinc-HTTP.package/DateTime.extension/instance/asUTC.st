*zinc-http
asUTC
	^self class newGmtWithYear: (self yearGmt) dayOfYear: (self dayOfYearGmt) 
       milliseconds: (self millisecondsGmt) timeZone: TimeZone sampleGMT