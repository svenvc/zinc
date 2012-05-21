initialize-release
open
	| fileStream |
	self close.
	fileStream := FileStream fileNamed: self pathName.
	fileStream setToEnd.
	self stream: fileStream.
	self event: (ZnLogEvent info: 'Opening ', self printString) 