testing
isBinary
	"Answers whether the contents of a resource described by me
	should be considered as binary instead of textual."
	
	| subParts |
	self main = 'text'
		ifTrue: [ ^ false ].
	subParts := self sub substrings: '+-'.
	(subParts anySatisfy: [ :subPart |
				self class textSubTypeFragments includes: subPart ])
		ifTrue: [ ^ false ].
	(subParts anySatisfy: [ :subPart | 
				self class textSubTypeFragments anySatisfy: [ :fragment | 
						subPart includesSubstring: fragment ] ])
		ifTrue: [ ^ false ].
	^ true