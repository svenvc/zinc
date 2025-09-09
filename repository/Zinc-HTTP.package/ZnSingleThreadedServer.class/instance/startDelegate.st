private
startDelegate
	self delegate
		ifNotNil: [ :delegate |
			(delegate respondsTo: #start)
				ifTrue: [ delegate start ] ]