public
get
	| sum |
	sum := self numbersForGet inject: 0 into: [ :sub :next | sub + next ].
	self response: (ZnResponse ok: (ZnEntity with: sum asString))