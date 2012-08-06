private html generation
generateHomepage
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType.
		stream << '<html>'.
		stream << self homepageData.
		stream << self standardPageFooter.
		stream << '</body></html>' ]
