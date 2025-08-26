private
generateHelp
	"Generate an HTML page with links to all pages I support"

	^ self brandedPage: 'Available Pages' do: [ :html |
		html tag: #ul do: [
			prefixMap keys sorted do: [ :each |
				html tag: #li do: [
					html tag: #a attributes: { #href . each } with: each ] ] ] ]