running
setUp
	| port |
	super setUp.
	port := 10000 + 1000 atRandom.
	server := ZnServer startOn: port.
	server delegate map: 'kvstore' to: ZnKeyValueStoreDelegate new.
	client := ZnKeyValueStoreClient new.
	client httpClient port: port