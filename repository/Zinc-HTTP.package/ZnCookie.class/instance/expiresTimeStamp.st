accessing
expiresTimeStamp
	"Return the DateAndTime when I will expire.
	Throw an exception when no expiration is set or the expiration cannot be parsed.
	See #isExpired"

	^ ZnUtils parseHttpDate: self expires