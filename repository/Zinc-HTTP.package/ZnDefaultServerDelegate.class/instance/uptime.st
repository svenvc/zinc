private
uptime
	| sessionAge |
	sessionAge := DateAndTime now - self bootTime.
	^ 'Uptime: {1}' format: { (sessionAge roundTo: 1 minute) humanReadablePrintString }