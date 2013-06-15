testing
testUriSum
	"Here we test doing a GET /sum/1/2/3"
	
	| input output |
	input := #(1 2 3).
	input do: [ :each | client addPathSegment: each asString ].
	output := client get.
	self assert: client isSuccess.
	self assert: output equals: input sum asString