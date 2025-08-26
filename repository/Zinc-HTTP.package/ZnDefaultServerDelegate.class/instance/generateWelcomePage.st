private
generateWelcomePage
	"Generate the HTML for the welcome page"

	^ self brandedPage: 'Zinc HTTP Components' do: [ :html |
		html tag: #p do: [ 
			($\ split: self welcomePageGreeting)
				do: [ :each | html str: each ] 
				separatedBy: [ html tag: #br ] ].
		self welcomePageLinksOn: html.
		html tag: #h4 with: 'May the Source be with you!' ]