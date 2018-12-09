private
generateNewKey
	^ ((10 raisedTo: 9) atRandom * Time totalSeconds) printStringBase: 36
