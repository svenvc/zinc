accessing
removePropertyAt: aKey

	^ self properties removeKey: aKey ifAbsent: [ ]