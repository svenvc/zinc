private
uptime
	| sessionAge |
	sessionAge := Time millisecondClockValue milliSeconds.
	^ 'Uptime: {1}' format: { (sessionAge roundTo: 1 minute) humanReadablePrintString }