printing
authorityPrintString
	^ String streamContents: [ :stream | 
			self printAuthorityOn: stream ]