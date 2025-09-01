private
processesOn: html
	"Render a the list of processes on html"
	
	html tag: #ol do: [
		self processes do: [ :each |
			html tag: #li do: [
				each = Processor activeProcess 
					ifTrue: [ 
						html tag: #b do: [
							self process: each on: html.
							html space; nextPut: $* ] ]
					ifFalse: [ 
						self process: each on: html  ] ] ] ]