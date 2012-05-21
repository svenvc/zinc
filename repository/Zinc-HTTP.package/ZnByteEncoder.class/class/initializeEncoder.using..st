private
initializeEncoder: encoder using: byteTextConverterClass
	"We are reusing the tables specified, computed and cached in subclasses of ByteTextConverter"
	
	encoder byteToUnicode: byteTextConverterClass byteToUnicodeTable.
	encoder unicodeToByte: byteTextConverterClass unicodeToByteTable