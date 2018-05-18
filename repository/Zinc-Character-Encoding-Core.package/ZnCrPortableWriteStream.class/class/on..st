instance creation
on: aStream

	^ self basicNew
		initialize;
		stream: aStream;
		yourself