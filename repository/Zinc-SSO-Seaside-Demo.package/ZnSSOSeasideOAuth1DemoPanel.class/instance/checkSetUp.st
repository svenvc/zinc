actions
checkSetUp

	self oauthService hasKeys
		ifFalse: [ self error: 'Consumer key and/or secret missing.' ].