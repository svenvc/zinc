private
serverClock
	| now |
	now := DateAndTime now asUTC.
	^ 'Server clock: {1}T{2}Z' format: { now asDate yyyymmdd . now asTime print24 }