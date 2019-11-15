accessing
at: headerName put: value ifPresentMerge: binaryBlock
	"Store value under headerName, when there is an existing entry,
	stored the result of evaluating binaryBlock with old and new value"

	| normalizedKey newValue |
	normalizedKey := self normalizeHeaderKey: headerName.
	newValue := self headers
		at: normalizedKey
		ifPresent: [ :existingValue | binaryBlock value: existingValue value: value ]
		ifAbsent: [ value ].
	^ self headers at: normalizedKey put: newValue