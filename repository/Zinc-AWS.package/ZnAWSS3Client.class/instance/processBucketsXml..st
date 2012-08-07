private
processBucketsXml: string
	| dom |
	dom := XMLDOMParser parse: string.
	^ ((dom allElementsNamed: 'Bucket') 
			collect: [ :each | 
				each contentStringAt: 'Name']) asArray