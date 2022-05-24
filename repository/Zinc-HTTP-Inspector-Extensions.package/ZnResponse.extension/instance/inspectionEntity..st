*Zinc-HTTP-Inspector-Extensions
inspectionEntity: aBuilder
	<inspectorPresentationOrder: 10 title: 'Entity'>
	 
	^ aBuilder newText
		text: self entity contents asString;
		yourself