testing
testQuerySum
	"Here we test a GET /sum?numbers=1,2,3"

	| input output |
	input := #(1 2 3).
	client queryAt: #numbers put: ($, join: input).
	output := client get.
	self assert: client isSuccess.
	self assert: output equals: input sum asString