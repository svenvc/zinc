instance creation
new
	"Answer a new and initialized instance of the receiver."

	^super new
		sessionType: 'no-encryption';
		assocType: self assocTypeHmacSHA1;
		yourself
