convenience
on: writeStream do: block
	"Execute block with as argument a ZnBufferedWriteStream on writeStream,
	making sure #flush is called at the end."
	
	| bufferedWriteStream |
	bufferedWriteStream := self on: writeStream.
	block value: bufferedWriteStream.
	bufferedWriteStream flush