private
generateDWBench
	"Generate the dynamic DW-Bench HTML page.
	Although the date/time is variable, the page size is constant."

	^ self brandedPage: 'DW-Bench' do:  [ :html |
		html tag: #table attributes: #(border 1 style 'border-collapse:collapse') do: [
			1 to: 25 do: [ :row |
				html tag: #tr do: [
					1 to: 25 do: [ :col |
						html tag: #td do: [ html print: row * col ] ] ] ] ].
		html tag: #h4 do: [
			html << Date today yyyymmdd; space; << Time now print24 ] ]