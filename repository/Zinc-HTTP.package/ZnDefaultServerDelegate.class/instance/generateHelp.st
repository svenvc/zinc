private
generateHelp
	"Generate an HTML page with links to all routes that I support"

	^ self brandedPage: 'Available Routes' do: [ :html |
		html tag: #ul do: [
			prefixMap keys sorted do: [ :each |
				html tag: #li do: [
					html tag: #a attributes: { #href . each } with: each ] ] ] ]