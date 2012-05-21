private
ignoringDeprecation: block
	[ block value ] 
		on: Deprecation 
		do: [ :exception | exception resume ]