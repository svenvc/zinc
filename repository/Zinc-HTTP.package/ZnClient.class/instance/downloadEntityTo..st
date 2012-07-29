convenience
downloadEntityTo: path
	"If I hold an entity, download it directly to a file.
	If path describes a file, use that. 
	If path describes a directory, use the last path segment of the URI to construct a file in that directory.."

	| target |
	self entity ifNil: [ ^ self ].
	target := ZnFileSystemUtils 
		downloadPathTo: path 
		for: self request uri lastPathSegment.
	ZnFileSystemUtils 
		fileNamed: target 
		do:  [ :fileStream |
			fileStream binary.
			self entity writeOn: fileStream ]