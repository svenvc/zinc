private
processKeysXml: string for: bucket
	| dom |
	dom := XMLDOMParser parse: string.
	^ ((dom allElementsNamed: 'Contents') 
			collect: [ :each | 
				(ZnAWSS3Key fromXml: each) 
					bucket: bucket; 
					yourself ]) asArray