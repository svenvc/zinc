testing
testPostSum
	"Here we test POSTing a text file with a number per line to /sum"
	
	| input output |
	input := #(1 2 3).
	client entity: (ZnEntity text: (String crlf join: input)).
	output := client post.
	self assert: client isSuccess.
	self assert: output equals: input sum asString