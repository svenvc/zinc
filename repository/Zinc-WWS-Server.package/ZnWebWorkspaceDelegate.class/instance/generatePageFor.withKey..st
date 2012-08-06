private html generation
generatePageFor: workspace withKey: key
	^ String streamContents: [ :stream |
		stream << ZnConstants standardHtmlDocType; crlf.
		stream << '<html>' << (self standardPageHeader format: { key }).
		stream << '<body>'.
		stream << (self standardPageProlog format: { key }).
		stream << '<pre><code class="smalltalk">' << workspace << '</code></pre>'.
		stream << self standardPageFooter.
		stream << '</body></html>' ]
