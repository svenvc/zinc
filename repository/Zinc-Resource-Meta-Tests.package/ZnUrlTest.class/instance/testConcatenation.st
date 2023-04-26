testing
testConcatenation
	self
		assert: 'http://example.com/foo/bar' asZnUrl / 'xyz'
		equals: 'http://example.com/foo/bar/xyz' asZnUrl.
	self
		assert: 'http://example.com/foo/bar/' asUrl / 'xyz'
		equals: 'http://example.com/foo/bar/xyz' asZnUrl.
	self
		assert: 'http://example.com/foo/bar' asUrl + 'xyz'
		equals: 'http://example.com/foo/xyz' asZnUrl.
	self
		assert: 'http://example.com/foo/bar/' asUrl + 'xyz'
		equals: 'http://example.com/foo/bar/xyz' asZnUrl.

	self
		assert: ('http://example.com/foo/bar' asZnUrl addPathSegment: 'xyz')
		equals: 'http://example.com/foo/bar/xyz' asZnUrl.
	self
		assert: ('http://example.com/foo/bar/' asUrl addPathSegment: 'xyz')
		equals: 'http://example.com/foo/bar/xyz' asZnUrl.
	self
		assert: ('http://example.com/foo/bar' asUrl withRelativeReference: 'xyz')
		equals: 'http://example.com/foo/xyz' asZnUrl.
	self
		assert: ('http://example.com/foo/bar/' asUrl withRelativeReference: 'xyz')
		equals: 'http://example.com/foo/bar/xyz' asZnUrl