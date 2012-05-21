private
generateUnicodeTest
	"Generate an HTML page containing all Unicode characters with code points between 0 and 16r024F in a nice table"
	
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType.
		stream << '<html><head><title>Unicode Test Page</title></head>'.
		stream << '<body><h1>Unicode Test Page</h1><table>'.
		0 to: 16r024F by: 8 do: [ :row |
			stream nextPutAll: '<tr>'.
			row to: row + 7 do: [ :each |
				stream nextPutAll: '<td>U+'.
				stream nextPutAll: (each printPaddedWith: $0 to: 4 base: 16). 
				stream nextPut: $=; nextPut: each asCharacter.
				stream nextPutAll: '</td>' ].
			stream nextPutAll: '</tr>' ].
		stream << '</table></body></html>' ]