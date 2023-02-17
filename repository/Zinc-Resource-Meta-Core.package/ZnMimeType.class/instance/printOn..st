printing
printOn: stream
	stream
		nextPutAll: self main;
		nextPut: $/;
		nextPutAll: self sub.
	parameters ifNotNil: [
		parameters
				keysAndValuesDo: [ :key :value |
					stream
						nextPut: $;;
						nextPutAll: key;
						nextPut: $=;
						nextPutAll: value ] ]