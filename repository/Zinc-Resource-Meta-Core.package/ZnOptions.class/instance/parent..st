private
parent: otherOptions
	parent
		ifNotNil: [ (ModificationForbidden
				for: self
				at: nil
				with: otherOptions
				retrySelector: #parent:) signal ].
	parent := otherOptions