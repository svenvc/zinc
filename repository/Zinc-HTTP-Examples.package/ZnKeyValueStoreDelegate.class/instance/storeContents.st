private
storeContents
	"Generate a string describing/listing the full contents of my key-value store"

	^ String streamContents: [ :out |
			access critical: [
				data isEmpty
					ifTrue: [ out << 'the key-value store is empty'; crlf ]
					ifFalse: [
						data keysAndValuesDo: [ :key :value |
							out << key << ' = ' << value; crlf ] ] ] ]