initialize-release
fromXml: dom
	self 
		key: (dom contentStringAt: 'Key');
		etag: (dom contentStringAt: 'ETag') withoutQuoting; 
		size: (Integer readFrom: (dom contentStringAt: 'Size') ifFail: [ -1 ]); 
		xml: dom
