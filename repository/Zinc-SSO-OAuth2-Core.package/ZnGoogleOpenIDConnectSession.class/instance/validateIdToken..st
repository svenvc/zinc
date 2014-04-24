private
validateIdToken: aString
	"TO DO!"
	
"From Google: https://developers.google.com/accounts/docs/OAuth2Login#obtainuserinfo

An ID token is a cryptographically signed JSON object encoded in base 64. Normally, it is critical that you validate an ID token before you use it, but since you are communicating directly with Google over an intermediary-free HTTPS channel and using your client secret to authenticate yourself to Google, you can be confident that the token you receive really comes from Google and is valid. If your server passes the ID token to other components of your app, it is extremely important that the other components validate the token before using it."