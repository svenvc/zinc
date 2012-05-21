operations put
httpPut: string to: urlObject user: username passwd: password 
	"We're implementing the weird semantics of the original ;-)"

	| client |
	(client := self client)
		url: urlObject; 
		setBasicAuthenticationUsername: username password: password; 
		entity: (ZnEntity with: string type: ZnMimeType applicationOctetStream);
		put.
	^ String streamContents: [ :stringStream | client response writeOn: stringStream ]