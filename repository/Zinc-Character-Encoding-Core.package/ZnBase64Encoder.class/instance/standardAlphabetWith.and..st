initialization
standardAlphabetWith: beforeLastCharacter and: lastCharacter
	"Typically more alphabets use the same first 62 characters, A-Z, a-z, 0-9,
	and only differ in the last two characters used.
	Configure me to use the first 62 standard characters with
	beforeLastCharacter and lastCharacter as final two."

	| characters |
	characters := ($A to: $Z) , ($a to: $z) , ($0 to: $9), { beforeLastCharacter. lastCharacter }.
	^ self alphabet: (String withAll: characters)