accessing
next: count putAll: collection startingAt: offset
	"Write count characters from collection starting at offset.
	This is an inefficient implementation, writing characters one by one."
	
	0 to: count - 1 do: [ :each | 
		self nextPut: (collection at: offset + each) ]