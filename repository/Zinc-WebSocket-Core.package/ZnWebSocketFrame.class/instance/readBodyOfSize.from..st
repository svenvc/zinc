private
readBodyOfSize: size from: stream
	| mask |
	masked 
		ifTrue: [ 
			mask := stream next: 4.
			body := ByteArray new: size streamContents: [ :out |
				1 to: size do: [ :index |
					out nextPut: (stream next bitXor: (mask at: ((index - 1) \\ 4) + 1)) ] ] ]
		ifFalse: [
			body := stream next: size ]