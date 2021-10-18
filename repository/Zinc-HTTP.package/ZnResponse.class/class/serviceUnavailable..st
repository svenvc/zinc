instance creation
serviceUnavailable: string
	^ (self statusLine: ZnStatusLine serviceUnavailable)
		entity: (ZnEntity textCRLF: string);
		yourself