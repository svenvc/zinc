testing
testUTF8IllegalInput
	"See Unicode 14 standard, chapter 3, Conformance, 3.9 Unicode Encoding Forms, tables 3.6 & 3.7"

	{
		#[16rC0 16rAF].
		#[16rE0 16r9F 16r80].
		#[16rF4 16r90 16r80 16r80]
	} do: [ :bytes |
		self
			should: [ ZnCharacterEncoder utf8 decodeBytes:bytes ]
			raise: ZnInvalidUTF8 ]