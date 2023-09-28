printing
printContentsOn: stream
	super printContentsOn: stream.
	stream << 'WebSocket Generic Log Event ';  print: subject