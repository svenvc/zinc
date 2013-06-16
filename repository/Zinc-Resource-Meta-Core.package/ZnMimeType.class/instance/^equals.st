comparing
= other
	^ (self class == other class)
		and: [ self main = other main
		and: [ self sub = other sub ] ]