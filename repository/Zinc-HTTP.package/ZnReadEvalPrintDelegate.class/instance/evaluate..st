private
evaluate: string
	| output |
	output := String streamContents: [ :out | 
		[ 	| result |
			result := Compiler evaluate: string. 
			out print: result; cr ]
			on: Error, ParserNotification
			do: [ :exception |
				out print: exception; cr.
				exception signalerContext printDetails: out.
				exception signalerContext sender debugStack: 8 on: out ].
		out cr ].
	^ String lf join: output lines