private
copyAndPrepareRequest: aRequest
	"We make a copy of the request and augment its URL"

	| copiedRequest |
	copiedRequest := aRequest copy.
	copiedRequest url: (self augmentUrl: copiedRequest url).
	^ copiedRequest