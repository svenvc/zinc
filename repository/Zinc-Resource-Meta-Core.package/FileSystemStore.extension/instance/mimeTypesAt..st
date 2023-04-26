*Zinc-Resource-Meta-Core
mimeTypesAt: aPath
	| mimeType |
	mimeType := ZnMimeType
						forFilenameExtension: aPath extension
						ifAbsent: [  ^ nil ].
	^ Array with: mimeType