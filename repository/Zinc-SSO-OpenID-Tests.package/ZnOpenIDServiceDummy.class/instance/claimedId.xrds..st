initialize-release
claimedId: claimedId xrds: aString
	self httpClient: (ZnHttpClientDummy new
		responseForGet: claimedId content: aString).