accessing - query
queryAt: key put: value
	"Modify the receiver by setting a query variable key=value.
	If key is already exists, it is overwritten."

	query ifNil: [ query := ZnMultiValueDictionary new ].
	query at: key asString put: (value ifNotNil: [ value asString ])