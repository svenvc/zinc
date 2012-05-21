private
generateDWBench
	"Generate the dynamic DW-Bench HTML page.
	Although the date/time is variable, the page size is constant."
	
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType.
		stream << '<html><head><title>DW-Bench Dynamic</title></head>'.
		stream << '<body><h1>DW-Bench Dynamic</h1><table border=1>'.
		1 to: 25 do: [ :row |
			stream << '<tr>'.
			1 to: 25 do: [ :col |
				stream << '<td>'; print: row * col; << '</td>' ].
			stream << '</tr>' ].
		stream << '</table><p>'; << Date today yyyymmdd; space; << Time now print24; << '</p></body></html>' ]