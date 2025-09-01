private
processes
	^ (Process allSubInstances
		reject: [ :each | each isTerminated ])
		sorted: #priority descending , #name ascending 