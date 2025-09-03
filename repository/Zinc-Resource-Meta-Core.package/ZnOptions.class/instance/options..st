private
options: dictionary
	options
		ifNotNil: [ (ModificationForbidden
				for: self
				at: nil
				with: dictionary
				retrySelector: #options:) signal ].
	options := dictionary