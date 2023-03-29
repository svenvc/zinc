accessing
position

	"If the buffer advanced, we need to check the original stream position, minus what we have read.
	The -1 is because the buffer is base 1"
	^ stream position - limit + position - 1