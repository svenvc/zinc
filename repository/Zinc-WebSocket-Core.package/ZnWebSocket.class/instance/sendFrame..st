private
sendFrame: frame
	"Send a single frame, masked when I am in a client role, flush"
	
	frame masked: self isClient.
	frame writeOn: stream.
	stream flush.