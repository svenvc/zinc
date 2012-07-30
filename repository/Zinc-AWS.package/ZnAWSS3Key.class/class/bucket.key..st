instance creation
bucket: bucket key: key
	^ (self new)
		bucket: bucket;
		key: key;
		yourself