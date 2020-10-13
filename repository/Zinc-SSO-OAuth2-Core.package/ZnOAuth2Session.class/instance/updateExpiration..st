public
updateExpiration: timeoutInteger
	"Update my expiration date and time.
	Convert current date and time to UTC to prevent daylight saving issues."
	expiresOn := DateAndTime now asUTC + timeoutInteger
