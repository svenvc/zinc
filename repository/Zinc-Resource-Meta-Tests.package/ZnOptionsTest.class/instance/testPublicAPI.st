tests
testPublicAPI
	| localOptions originalValue |
	localOptions := ZnOptions globalDefault clone.
	originalValue := ZnOptions globalDefault at: #signalProgress.
	"Access an option, anywhere"
	self assert: (ZnCurrentOptions at: #signalProgress) equals: originalValue.
	"Set a global writable option, visible to anyone"
	ZnOptions globalDefault at: #signalProgress put: originalValue not.
	self assert: (ZnCurrentOptions at: #signalProgress) equals: originalValue not.
	ZnOptions globalDefault at: #signalProgress put: originalValue.
	"Access an option, using local option, unless set dynamically"
	localOptions conditionallyDuring: [
		self assert: (ZnCurrentOptions at: #signalProgress) equals: originalValue ].
	"Access an option, using local option, unless set dynamically, when set locally"
	localOptions at: #signalProgress put: originalValue not.
	localOptions conditionallyDuring: [
		self assert: (ZnCurrentOptions at: #signalProgress) equals: originalValue not ].
	"Access an option, using local option, unless set dynamically, when set locally,
	but again overwritten dynamically"
	localOptions at: #signalProgress put: originalValue not.
	localOptions clone
		at: #signalProgress put: originalValue;
		during: [
			localOptions conditionallyDuring: [
				self assert: (ZnCurrentOptions at: #signalProgress) equals: originalValue ] ]