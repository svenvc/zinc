tests
testText
	self 
		assert: (ZnDataUrl text: 'Les élèves Français')
		equals: (ZnDataUrl text: 'Les élèves Français').
	self 
		assert: (ZnDataUrl text: 'Les élèves Français') hash
		equals: (ZnDataUrl text: 'Les élèves Français') hash.
	self 
		assert: (ZnDataUrl text: 'Les élèves Français') printString
		equals: (ZnDataUrl text: 'Les élèves Français') printString