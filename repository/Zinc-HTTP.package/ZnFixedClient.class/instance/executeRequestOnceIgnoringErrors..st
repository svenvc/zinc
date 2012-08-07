private
executeRequestOnceIgnoringErrors: request
	^ [ self executeRequestOnce: request ] 
		on: Error 
		do: [ :err | 
			self log debug: [ 'Once Ignoring ', err printString ].
			nil ]