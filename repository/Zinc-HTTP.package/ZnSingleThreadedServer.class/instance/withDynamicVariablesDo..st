private
withDynamicVariablesDo: block
	^ ZnCurrentServer
		value: self
		during: [
			self localOptions conditionallyDuring: block ]