private
closeSocketStream: socketStream
	[ socketStream close ] 
		on: Error 
		do: [ :exception | exception printString, ' during close' ]