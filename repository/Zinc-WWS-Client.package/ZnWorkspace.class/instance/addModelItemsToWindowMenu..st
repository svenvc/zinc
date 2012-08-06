window menu
addModelItemsToWindowMenu: aMenu 
	super addModelItemsToWindowMenu: aMenu.
	
	aMenu addLine.
	
	aMenu
		add: 'Open web workspace...'
		target: self
		action: #openWWSCommand.
	aMenu lastItem icon: self theme smallOpenIcon.

	aMenu
		add: 'Save as web workspace...'
		target: self
		action: #saveAsWWSCommand.
	aMenu lastItem icon: self theme smallSaveAsIcon.
	
	url ifNotNil: [
		aMenu
			add: 'Reload web workspace'
			target: self
			action: #reloadWWSCommand.
			
		aMenu
			add: 'Copy web workspace URL'
			target: self
			action: #copyWWSUrlCommand ]
