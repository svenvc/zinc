accessing
text: string
	self body: (ZnUTF8Encoder new encodeString: string)
