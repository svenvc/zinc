private
currentWorldAsPng
	^ ByteArray streamContents: [ :out |
		  PNGReadWriter putForm: self currentWorld imageForm onStream: out ]