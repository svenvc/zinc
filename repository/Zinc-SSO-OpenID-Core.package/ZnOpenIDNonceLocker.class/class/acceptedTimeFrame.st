accessing
acceptedTimeFrame
	^ AcceptedTimeFrame ifNil: [ AcceptedTimeFrame := 10 minutes ]