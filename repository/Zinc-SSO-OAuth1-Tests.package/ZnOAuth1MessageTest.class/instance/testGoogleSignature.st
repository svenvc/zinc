tests
testGoogleSignature

	| baseString key |
	
	baseString := 'GET&https%3A%2F%2Fwww.google.com%2Faccounts%2FOAuthGetRequestToken&oauth_callback%3Dhttp%253A%252F%252Fgooglecodesamples.com%252Foauth_playground%252Findex.php%26oauth_consumer_key%3Dtest2.doit.st%26oauth_nonce%3Daf4aa64aafe3b959d0b249225ee887a8%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1297166598%26oauth_version%3D1.0%26scope%3Dhttps%253A%252F%252Fwww.google.com%252Fcalendar%252Ffeeds%252F'.
	
	key := 'jXGgXXXXXXn28YYYYYavPHq&'.
	
	self assert: (self signStringSHA1: baseString usingSecret: key) = 'r4ELOrYf9Oqd2YhOu85hXs81muY='
		
