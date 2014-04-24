acccessing
statusString
	| vm |
	vm := SmalltalkImage current vm.
	^ String streamContents: [ :out | 
		out 
			print: DateAndTime now;
			space;
			<< 'memory '; print: vm memoryEnd; << ' bytes ' ;
			print: (vm memoryEnd - vm youngSpaceEnd / vm memoryEnd * 100.0); << '% free' ]