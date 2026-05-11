writing
nextPutAll: collection
	"Write a collection of elements"

	chunks add: collection copy.
	totalSize := totalSize + collection size.