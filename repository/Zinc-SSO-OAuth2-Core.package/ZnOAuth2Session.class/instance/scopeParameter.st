private
scopeParameter

	^ String streamContents: [ :stream |
		self scopes
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream nextPut: Character space ] ]