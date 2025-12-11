private
uptime
	| sessionAge |
	sessionAge := DateAndTime now - self bootTime.
	^ (sessionAge roundTo: 1 minute) humanReadablePrintString