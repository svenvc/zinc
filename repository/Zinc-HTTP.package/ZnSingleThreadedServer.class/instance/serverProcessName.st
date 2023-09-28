private
serverProcessName
	^ String streamContents: [ :stream |
		stream nextPutAll: self class name; nextPutAll: ' HTTP port '; print: self port.
		self serverId ifNotNil: [ :id | stream space; << id ].
		self route ifNotNil: [ :id | stream space; << id ] ]