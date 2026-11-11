private
withByteOrderMarks: pattern
	"pattern with each < replaced by U+FEFF"

	^ pattern copyReplaceAll: '<' with: (String with: (Character value: 16rFEFF))