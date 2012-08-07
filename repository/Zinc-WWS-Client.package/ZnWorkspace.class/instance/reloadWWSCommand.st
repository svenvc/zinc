window menu
reloadWWSCommand
	self warnUser
		ifTrue: [ self openUrl: url ]