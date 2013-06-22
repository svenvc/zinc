actions
executeRequest: aRequest token: anAccessToken
	" Execute the HTTP request <aRequest>. Use <anAccessToken> to set the OAuth Authorization header."

	^self executeRequest: aRequest token: anAccessToken followRedirects: true