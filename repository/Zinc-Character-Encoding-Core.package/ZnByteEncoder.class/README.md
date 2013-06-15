I am ZnByteEncoder, a concrete subclass of ZnCharacterEncoder.
I handle single byte encodings where byte values 0 to 127 map to ASCII
and 128 to 255 are a permutation to Unicode characters.

I derive my mappings by parsing official unicode.org specifications.

Part of Zinc HTTP Components.