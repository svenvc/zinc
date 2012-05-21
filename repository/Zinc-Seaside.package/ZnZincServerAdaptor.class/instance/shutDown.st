private
shutDown
	self server isNil
		ifFalse: [ self server stop ]