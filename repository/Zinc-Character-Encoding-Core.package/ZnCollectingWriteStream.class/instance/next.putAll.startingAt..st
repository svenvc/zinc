writing
next: count putAll: collection startingAt: offset
	"Write count elements from collection starting at offset."
	
	chunks add: (collection copyFrom: offset to: offset + count).
	totalSize := totalSize + count