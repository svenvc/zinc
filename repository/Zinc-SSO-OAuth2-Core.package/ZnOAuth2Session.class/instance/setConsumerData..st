initialize-release
setConsumerData: aConsumerData

	consumerData := aConsumerData.
	redirectUrl := aConsumerData ifNotNil: [ aConsumerData redirectUrl ]
