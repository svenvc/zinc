accessing
defaultPortForScheme: scheme
	scheme = #http ifTrue: [ ^ 80 ].
	scheme = #https ifTrue: [ ^ 443 ].
	(ZnUnknownScheme scheme: scheme) signal