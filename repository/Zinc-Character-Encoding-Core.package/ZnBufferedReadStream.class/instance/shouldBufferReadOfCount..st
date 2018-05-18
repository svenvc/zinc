private
shouldBufferReadOfCount: elementCount
	"For larger read requests, buffering fails to give an advantage."

	^ elementCount < (buffer size / 2)