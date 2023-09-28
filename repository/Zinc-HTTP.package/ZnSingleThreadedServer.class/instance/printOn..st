printing
printOn: stream
	super printOn: stream.
	stream nextPut: $(.
	stream nextPutAll: (self isRunning ifTrue: [ 'running' ] ifFalse: [ 'stopped' ]).
	self port ifNotNil: [ :port | stream space; print: port ].
	self bindingAddress ifNotNil: [ :bindingAddress | stream space; print: bindingAddress ].
	self serverId ifNotNil: [ :id | stream space; print: id ].
	self route ifNotNil: [ :id | stream space; print: id ].
	stream nextPut: $)