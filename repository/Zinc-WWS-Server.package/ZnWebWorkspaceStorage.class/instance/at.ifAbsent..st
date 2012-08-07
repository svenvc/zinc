accessing
at: key ifAbsent: block
	| fullName entry |
	fullName := self directory / (key first: 2) / key.
	(fullName containingDirectory fileExists: fullName localName)  
		ifFalse: [ ^ block value ].
	entry := fullName directoryEntry.
	^ FileStream 
		fileNamed: entry fullName 
		do: [ :stream | stream upToEnd ]