testing
testUTF8ByteOrderMark
  "The Unicode Byte Order Mark (BOM) should be skipped."

  | bom string bytes encoder decoded |
  encoder := ZnUTF8Encoder new.
  bom := #(239 187 191).
  string := 'élève en Français'.
  bytes := encoder encodeString: string.
  self assert: (encoder decodeBytes: bom , bytes) equals: string.
  self shouldnt: [ decoded := encoder decodeBytes: bom ] raise: ZnInvalidUTF8.	"GemStone skips bom during decoding"
  self assert: decoded = ''