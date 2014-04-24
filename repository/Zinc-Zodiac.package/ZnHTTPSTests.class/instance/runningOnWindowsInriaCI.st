private
runningOnWindowsInriaCI
	| platform ci |
	platform := OSPlatform current.
	ci := platform environment at: #CI ifAbsent: [ '' ].
	^ platform isWindows and: [ ci = 'ci.inria.fr' ]