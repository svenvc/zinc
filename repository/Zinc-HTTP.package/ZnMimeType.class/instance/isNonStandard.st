testing
isNonStandard
	"tests if the receiver is a non-standard mime type that is not registered with IANA"
	^ (self main beginsWith: 'x-')
		or: [ (self main beginsWith: 'X-')
		or: [ (self sub beginsWith: 'x-')
		or: [ self sub beginsWith: 'X-' ] ] ]