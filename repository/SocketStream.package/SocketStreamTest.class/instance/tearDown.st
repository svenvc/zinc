as yet unclassified
tearDown
	clientStream ifNotNil:[clientStream destroy].
	serverStream ifNotNil:[serverStream destroy].