accessing oauth
oAuthScope
	^self oAuthPropertyAt: 'scope' ifAbsent: [ nil ]