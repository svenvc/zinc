instance creation
on: readStream
	"Create an instance of ZnPositionableReadStream that wraps readStream to add limited positioning capabilities to it."

	^ self new
		on: readStream;
		yourself