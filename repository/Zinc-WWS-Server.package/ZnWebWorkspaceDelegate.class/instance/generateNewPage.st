private html generation
generateNewPage
	^ String streamContents: [ :stream |
		stream << '<!DOCTYPE html>'.
		stream << '<html>'.
		stream << self newPageData.
		stream << self standardPageFooter.
		stream << '</body></html>' ]
