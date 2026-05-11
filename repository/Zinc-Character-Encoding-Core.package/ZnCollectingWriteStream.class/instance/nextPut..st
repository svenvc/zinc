writing
nextPut: element
	"Write a single element"

	chunks add: element.
	totalSize := totalSize + 1.