testing
testSignalProgressWithoutTotal
	(ZnOptions globalDefault clone)
		at: #signalProgress put: true;
		during: [
			self
				should: [ ZnUtils signalProgress: 1500 total: nil ]
				raise: HTTPProgress
				withExceptionDo: [ :progress |
					self assert: (progress messageText includesSubstring: '1.50 kB') ] ]