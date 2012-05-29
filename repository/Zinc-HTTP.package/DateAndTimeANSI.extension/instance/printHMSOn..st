*zinc-http
printHMSOn: aStream
	"Print just hh:mm:ss"
	aStream
		nextPutAll: (self hour asString padded: #left to: 2 with: $0);
		nextPut: $:;
		nextPutAll: (self minute asString padded: #left to: 2 with: $0);
		nextPut: $:;
		nextPutAll: (self second asString padded: #left to: 2 with: $0).
