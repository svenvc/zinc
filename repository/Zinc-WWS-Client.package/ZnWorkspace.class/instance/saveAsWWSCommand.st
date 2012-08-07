window menu
saveAsWWSCommand
	(UIManager default confirm: 'Are you sure you want to publish the contents of this workspace ?')
		ifFalse: [ ^ self ].
	self codeTextMorph 
		ifNotNil: [ :morph | | stringToSave |
			stringToSave :=  morph text string.
			url := ZnWebWorkspaceAccessor new post: stringToSave.
			self label: url asString.
			self contents: stringToSave.
			self changed: #contents ]