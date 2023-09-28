initialization
initialize
	super initialize.
	timestamp := DateAndTime now.
	id := self nextId.
	processId := ZnUtils currentProcessID