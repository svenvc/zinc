stream
streamStringContents: block
	"Execute block with a write stream as an argument, returning the resulting String.
	The stream is also wrapped in a buffered stream so that individual elements do not get collected,
	instead waiting for buffer sized chunks."

	| collector |
	collector := self new.
	ZnBufferedWriteStream 
		on: collector 
		do: [ :out | block value: out ].
	^ collector convertTo: String