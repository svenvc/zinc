private html generation
generateNewPage
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType.
		stream << '<html>'.
		stream << self newPageData.
		stream << self standardPageFooter.
		stream << '</body></html>' ]
