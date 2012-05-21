private
normalizeHeaderKey: string
	"Test string to see if it has proper header key capitalization,
	if true, return string, if not, return a properly capitalized copy"
	
	^ (ZnUtils isCapitalizedString: string)
		ifTrue: [ string ] 
		ifFalse: [ ZnUtils capitalizeString: string ] 