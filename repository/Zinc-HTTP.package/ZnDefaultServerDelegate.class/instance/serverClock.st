private
serverClock
	| now date time |
	now := DateAndTime now asUTC.
	date := now asDate yyyymmdd.
	time := String streamContents: [ :out | 
		now asTime print24: true showSeconds: true on: out ].
	^ '{1}T{2}Z' format: { date . time }