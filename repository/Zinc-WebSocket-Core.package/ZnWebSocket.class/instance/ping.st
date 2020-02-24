protocol
ping
	"Send a generic ping (with an empty payload).
	Ping messages are sent automatically from #runWith: as a keep alive
	whenever the connection times out and loops. 
	The interval is thus the connection's read time out"
	
	self pingEmpty