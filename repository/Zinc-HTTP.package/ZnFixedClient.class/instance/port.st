accessing
port
	port isNil ifTrue: [ port := ZnUrl defaultPortForScheme: self scheme ].
	^ port