options
ifFailBlock
	"Return the block that I should execute if the request fails.
	Defaults to nil. Accepts an exception as argument."
	
	^ self optionAt: #ifFailBlock ifAbsent: [ nil ]