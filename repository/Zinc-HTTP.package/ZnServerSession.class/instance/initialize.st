initialize-release
initialize
	super initialize.
	attributes := SmallDictionary new.
	created := modified := DateAndTime now