rendering
renderContentOn: html

	| json |
	
	self hasAccessToken
		ifFalse: [ ^self renderVerificationCodeFormOn: html ].
		
	self renderStatusFormOn: html. 
	
	html heading
		level: 3 ;
		with: 'Account properties'.

	json := self twitterAccess accountVerifyCredentials.
	self renderJSONDict: json on: html.
	
	json at: 'profile_image_url' ifPresent: [ :url | self renderImage: url on: html ]
