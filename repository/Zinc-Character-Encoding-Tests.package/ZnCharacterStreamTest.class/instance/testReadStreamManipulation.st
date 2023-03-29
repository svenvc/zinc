tests
testReadStreamManipulation
	#('abc' 'élève' 'français' 'ö-ö') do: [ :string |
		#(utf8 latin1 utf16 utf32) do: [ :encoding |
			| bytes stream |
			bytes := string encodeWith: encoding.
			stream := ZnCharacterReadStream on: bytes readStream encoding: encoding.
			self assert: stream upToEnd equals: string.
			stream back.
			self assert: stream next equals: string last.
			string size timesRepeat: [ stream back ].
			self assert: stream next equals: string first.
			0 to: bytes size - 1 do: [ :position |
				stream position: position.
				self assert: (string includes: stream next) ].
			self assert: stream atEnd.
			stream position: 0.
			self assert: stream next equals: string first.
			stream position: bytes size - 1.
			self assert: stream next equals: string last ] ]