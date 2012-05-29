as yet unclassified
at: key ifPresent: aBlock
	"overridden because in pharo ifPresent:  doesn't gete sent anything"

	| v |
	v := self at: key ifAbsent: [^ nil].
	^ aBlock value