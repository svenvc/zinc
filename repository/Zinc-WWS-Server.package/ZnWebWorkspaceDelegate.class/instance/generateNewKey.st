private
generateNewKey
	^ ((10 raisedTo: 9) atRandom * Time primSecondsClock) printStringBase: 36
