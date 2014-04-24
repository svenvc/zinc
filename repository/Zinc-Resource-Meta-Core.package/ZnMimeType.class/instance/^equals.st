comparing
= other
	"#matches should be used instead of #= to ignore parameters."

	^ (self class == other class)
		and: [ self main = other main
			and: [ self sub = other sub 
				and: [ self hasParameters not & other hasParameters not
						or: [ self parameters = other parameters ] ] ] ] 