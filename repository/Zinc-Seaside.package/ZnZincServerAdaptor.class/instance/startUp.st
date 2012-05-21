private
startUp
	self server isNil
		ifFalse: [ self server start ]