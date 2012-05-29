convenience
downloadEntityTo: path
	"If I hold an entity, download it directly to a file.
	If path describes a file, use that. 
	If path describes a directory, use the last path segment of the URI to construct a file in that directory.."

	| target |
	self entity ifNil: [ ^ self ].
	target := ServerFileDirectory on: path.
	target := target exists 
		ifTrue: [ (target / self request uri lastPathSegment) pathName ] 
		ifFalse: [ path ].
	FileStream 
		fileNamed: target 
		do: [ :fileStream |
			fileStream binary.
			self entity writeOn: fileStream ]