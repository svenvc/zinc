instance creation
withConsumerData: aConsumerData

	^self new
		initializeWith: ZnOpenIDConnectDiscoveryDocument google consumerData: aConsumerData 