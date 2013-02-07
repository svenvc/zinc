private
closeDelegate
	self delegate
		ifNotNil: [ :delegate | 
			(delegate respondsTo: #close)
				ifTrue: [ 
					self log debug: 'Closing delegate'.
					delegate close ] ]