private
generateUnicodeTest
	"Generate an HTML page containing all Unicode characters with code points between 0 and 16r024F in a nice table"

	^ self brandedPage: 'Unicode Test Page' do: [:html |
		html tag: #table do: [
			0 to: 16r024F by: 8 do: [ :row |
				html tag: #tr do: [
					row to: row + 7 do: [ :each |
						html tag: #td do: [ | unicodeNotation |
							unicodeNotation := 'U+{1}' format: { each printPaddedWith: $0 to: 4 base: 16 }.
							html 
								tag: #span attributes: #(style 'color:grey') with: unicodeNotation;
								space;
								tag: #span attributes: #(style 'font-weight:bold') with: each asCharacter asString ] ] ] ] ] ]