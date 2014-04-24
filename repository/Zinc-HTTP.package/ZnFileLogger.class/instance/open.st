initialize-release
open
	| fileStream |
	self close.
	fileStream := ZnFileSystemUtils fileStreamFor: self pathName.
	fileStream setToEnd.
	self stream: fileStream.
	self event: (ZnLogEvent info: 'Opening ', self printString) 