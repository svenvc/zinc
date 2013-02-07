utility
signStringSHA1: aString usingSecret: aSecret 
	"Signs a string with <aSecret>, and encode the
	resulting byteArray into plain ASCII with base64."
	
	| hmac digest |

	hmac := SHA1 new hmac.
	hmac key: aSecret asByteArray.
	digest := hmac digestMessage: aString asByteArray.
	^ZnBase64Encoder new encode: digest