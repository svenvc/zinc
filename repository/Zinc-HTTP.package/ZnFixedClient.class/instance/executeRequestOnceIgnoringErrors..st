private
executeRequestOnceIgnoringErrors: request
	^ [ self executeRequestOnce: request ] 
		on: Exception 
		do: [ :err | 
			self log debug: [ 'Once Ignoring ', err printString ].
			nil ]