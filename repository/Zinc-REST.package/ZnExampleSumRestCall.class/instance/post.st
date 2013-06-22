public
post
	| sum |
	sum := self numbersForPost inject: 0 into: [ :sub :next | sub + next ].
	self response: (ZnResponse ok: (ZnEntity with: sum asString))