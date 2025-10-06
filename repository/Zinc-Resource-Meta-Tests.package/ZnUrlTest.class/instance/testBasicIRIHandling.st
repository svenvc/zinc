testing
testBasicIRIHandling
	| iri url |
	iri := 'https://fr.wikipedia.org/wiki/Ångström?enquête=zéro#fragment%20(forme%20littéraire)'.
	url := nil.
	self should: [ iri asUrl ] raise: Error.
	ZnOptions globalDefault clone
		at: #urlAsIri put: true;
		during: [ 
			url := iri asUrl.
			self assert: url lastPathSegment equals: 'Ångström'.
			self assert: url fragment equals: 'fragment (forme littéraire)'.
			self assert: (url queryAt: 'enquête') equals: 'zéro'.
			self assert: url printString equals: iri ].
	self deny: url printString equals: iri