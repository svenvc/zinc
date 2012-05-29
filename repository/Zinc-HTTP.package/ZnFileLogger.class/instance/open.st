as yet unclassified
open
	| fileStream |
	self close.
	fileStream := GsFile openAppendOnServer: self pathName.
	self stream: fileStream.
	self event: (ZnLogEvent info: 'Opening ', self printString)