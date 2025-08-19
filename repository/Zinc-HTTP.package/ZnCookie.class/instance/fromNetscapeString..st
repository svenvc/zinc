converting
fromNetscapeString: string
	| tokens |
	tokens := string findTokens: { Character tab }.
	self domain: tokens first.
	"subdomains is always true"
	self path: tokens third.
	self secure: tokens fourth asUppercase = 'TRUE'.
	tokens fifth = '0'
		ifFalse: [ self expiresTimeStamp: (DateAndTime fromUnixTime: tokens fifth asInteger) ].
	self name: tokens sixth.
	self value: tokens seventh