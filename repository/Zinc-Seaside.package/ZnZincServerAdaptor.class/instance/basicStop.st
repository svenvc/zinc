private
basicStop
	self server isNil
		ifFalse: [ self server stop ].
	self server: nil