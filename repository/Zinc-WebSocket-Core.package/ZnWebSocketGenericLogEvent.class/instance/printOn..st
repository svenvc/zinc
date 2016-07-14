printing
printOn: stream
	super printOn: stream.
	stream << ' WebSocket Generic Log Event ';  print: subject