accessing
accept
	^ self headers singleAt: 'Accept' ifAbsent: [ '*/*' ]