testing
generateTestFiles
	"self generateTestFiles"
	
	(Integer primesUpTo: 100) do: [ :each | | size |
		size := 1024 * each + each.
		('test-', size asString, '.txt') asFileReference writeStreamDo: [ :stream |
			stream nextPutAll: (self generateTestData: size) ] ]