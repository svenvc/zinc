convenience
decodeBytesSingleReplacement: bytes
	"Decode bytes and return the resulting string.
	This variant of #decodeBytes: will only ever use 
	a single replacement character for each illegal UTF-8 sequence"

	| byteStream replaced replacement char |
	byteStream := bytes readStream.
	replaced := false.
	replacement := self replacementCodePoint asCharacter.
	^ String streamContents: [ :stream |
		[ byteStream atEnd ] whileFalse: [
			char := self nextFromStream: byteStream.
			char = replacement
				ifTrue: [
					replaced 
						ifFalse: [
							replaced := true.
							stream nextPut: replacement ] ]
				ifFalse: [
					replaced := false.
					stream nextPut: char ] ] ]