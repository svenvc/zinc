accessing
defaultPortForScheme: scheme
	(#(http ws) includes: scheme) ifTrue: [ ^ 80 ].
	(#(https wss) includes: scheme)  ifTrue: [ ^ 443 ].
	(ZnUnknownScheme scheme: scheme) signal