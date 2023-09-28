printing
printHeaderOn: stream
	"Print my generic context part, <date> <time> <seq-nr> <process> [ subclass addition], to stream"
	
	timestamp printYMDOn: stream.
	stream space.
	timestamp printHMSOn: stream.
	stream space.
	id \\ 1000 printOn: stream base: 10 length: 3 padded: true.
	stream space.
	processId printOn: stream base: 10 length: 6 padded: true