running
tearDown
	ZnFileSystemUtils 
		deleteIfExists: 'small.html'; 
		deleteIfExists: 'large.html'; 
		deleteIfExists: 'wide.html'.
	super tearDown	
	