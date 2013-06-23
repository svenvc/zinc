mappings
mappingToIdentifiers
	"Return a dictionay mapping from encoding specifications to a list of encoding names."
	
	^ Dictionary newFromPairs: #(
		#cp1250Mapping #('cp-1250') 
		#cp1252Mapping #('cp-1252')
		#cp1253Mapping #('cp1253')
		#iso885915Mapping #('iso-8859-15') 
		#iso88591Mapping #('iso-8859-1' 'latin1' 'latin-1') 
		#iso88592Mapping #('iso-8859-2' 'latin2' 'latin-2') 
		#iso88597Mapping #('iso-8859-7') 
		#koi8rMapping #('iso-8859-15')
		#macRomanMapping #('mac-roman' 'macintosh') )