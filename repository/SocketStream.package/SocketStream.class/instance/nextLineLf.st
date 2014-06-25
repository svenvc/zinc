as yet unclassified
nextLineLf
	| nextLine |
	nextLine := self upToAll: String lf.
	^nextLine