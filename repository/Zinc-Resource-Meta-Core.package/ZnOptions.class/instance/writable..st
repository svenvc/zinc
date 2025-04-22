private
writable: boolean
	writable
		ifNotNil: [ (ModificationForbidden
				for: self
				at: nil
				with: boolean
				retrySelector: #writable:) signal ].
	writable := boolean