private html generation
generateHomepage
	^ String streamContents: [ :stream |
		stream << '<!DOCTYPE html>'.
		stream << '<html>'.
		stream << self homepageData.
		stream << self standardPageFooter.
		stream << '</body></html>' ]
