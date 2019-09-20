initialize-release
setConsumerData: aConsumerData

	(consumerData := aConsumerData)
		ifNotNil: [ 
			redirectUrl := aConsumerData redirectUrl ]
