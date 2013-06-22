initialize-release
initialize
	super initialize.
	attributes := GRSmallDictionary new.
	created := modified := DateAndTime now