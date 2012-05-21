private
closeSocketStream: socketStream
	[ socketStream close ] 
		on: Exception 
		do: [ :exception | exception printString, ' during close' ]