private
augmentUrl: aUrl
	"The URL in a server request has no scheme, host or port set.
	Augment aUrl by taking those elements from #serverUrl"

	self server ifNil: [ ^ aUrl ].
	^ aUrl inContextOf: self server url