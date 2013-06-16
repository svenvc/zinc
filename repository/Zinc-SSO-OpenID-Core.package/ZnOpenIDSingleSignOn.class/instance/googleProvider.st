convenience
googleProvider

	^self providers detect: [ :each | each name = self class providerNameGoogle ]