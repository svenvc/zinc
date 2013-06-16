private
generateHelp
	"Generate an HTML page with links to all pages I support"
	
	| title |
	title := self class name, ' Help'.
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType.
		stream << '<html><head><title>'; << title; << '</title></head>'.
		stream << '<body><h1>'; << title; << '</h1><h3>Available Pages</h3><ul>'.
		prefixMap keys sorted do: [ :each | 
			stream << '<li><a href="'; << each; << '">'; << each; << '</a></li>' ].
		stream << '<ul></body></html>' ]