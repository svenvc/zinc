rendering
renderJSONDict: jsonDict on: html

	html unorderedList: [
		jsonDict keysAndValuesDo: [ :key :value |
			html listItem: [
				html text: key.
				value isDictionary 
					ifTrue: [ 
						html text: ':'.
						self renderJSONDict: value on: html ]
					ifFalse: [ 
						html text: ' --> '; text: value ] ] ] ]