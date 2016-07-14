public
get

	"Raise a Notification during the operation. E.g. when using
	NativeBoost a NBRecursionDetect will be notified that should
	not abort the execution"
	Notification signal: 'Something to note'.
	self jsonResponse: Dictionary new.