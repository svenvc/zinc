accessing
peek
	"Return the next element but do not move over it"

	^ self savingPositionDo: [ self next ]