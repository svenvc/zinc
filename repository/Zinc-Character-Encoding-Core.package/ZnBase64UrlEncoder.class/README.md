I provide base64url encoding/decoding as specified in RFC 4648 section 5, "Base 64 Encoding with URL and Filename Safe Alphabet".

The encoding is technically identical to what is usually known as Base64 encoding, except that $- is used in place of $+ and $_ in place of $/. Also, if the data length is known implicitly,  padding by $= can be skipped. 