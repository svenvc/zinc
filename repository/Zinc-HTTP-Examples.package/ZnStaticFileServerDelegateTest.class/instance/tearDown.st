running
tearDown
	ZnFileSystemUtils
		deleteIfExists: 'small.html';
		deleteIfExists: 'large.html';
		deleteIfExists: 'wide.html';
		deleteIfExists: 'index.html'.
	'web/index.html' asFileReference ensureDeleteAll parent ensureDelete.
	super tearDown