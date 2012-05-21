private
indexFileIn: fileDirectory
	#( 'index.html' 'index.htm' ) do: [ :each |
			(fileDirectory fileExists: each)
				ifTrue: [ 
					^ (fileDirectory directoryEntryFor: each) fullName ] ].
	^ nil
