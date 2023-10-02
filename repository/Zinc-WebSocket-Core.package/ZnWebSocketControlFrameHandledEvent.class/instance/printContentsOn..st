printing
printContentsOn: stream
	super printContentsOn: stream.

	stream << 'WebSocket Control Frame Handled '; print: type