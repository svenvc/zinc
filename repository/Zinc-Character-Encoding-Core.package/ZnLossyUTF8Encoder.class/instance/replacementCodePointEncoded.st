accessing
replacementCodePointEncoded
	"Return the encoded utf-8 byte sequence for the Unicode Replacement Character U+FFFD"
	
	"self replacementCodePoint asCharacter utf8Encoded"
	
	^ #[239 191 189]