*Zinc-HTTP-Inspector-Extensions
inspectionHeaders: aBuilder
	<inspectorPresentationOrder: 10 title: 'Headers'>
	
	^ aBuilder newTable 
		addColumn: (SpStringTableColumn 
			title: 'Key'
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each key ])
			beSortable;
		addColumn: (SpStringTableColumn 
			title: 'Value' 
			evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each value ])
			beSortable;
		items: (self headers headers associations collect: [:e | StInspectorAssociationNode hostObject: e ]);
		yourself