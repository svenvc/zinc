printing
printContentsOn: stream
	super printContentsOn: stream.

	description ifNotNil: [ stream << 'Started '; << description ]