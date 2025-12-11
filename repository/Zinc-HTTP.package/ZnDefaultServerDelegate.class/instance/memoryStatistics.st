private
memoryStatistics
	| memoryTotal memoryFree |
	memoryTotal := Smalltalk vm memorySize.
	memoryFree := Smalltalk vm freeOldSpaceSize + Smalltalk vm edenSpaceSize - Smalltalk vm youngSpaceSize.
	^ 'allocated {1} bytes - {2} % free' format: { 
			memoryTotal asStringWithCommas. 
			( memoryFree / memoryTotal * 100.0) printShowingDecimalPlaces: 2 }