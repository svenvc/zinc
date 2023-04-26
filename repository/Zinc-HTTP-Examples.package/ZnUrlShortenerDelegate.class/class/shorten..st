utilities
shorten: urlOrString
	"Shorten urlOrString, store it in our database and return the key"

	"self shorten: 'https://pharo.org'."

	| key url |
	url := urlOrString asUrl.
	key := MD5 hashMessage: url printString.
	key := (key asInteger \\ (36 ** 6)) printStringBase: 36.
	self database at: key put: url.
	^ key