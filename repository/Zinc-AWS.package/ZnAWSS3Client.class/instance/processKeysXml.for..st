private
processKeysXml: dom for: bucket
	^ ((dom allElementsNamed: 'Contents') 
			collect: [ :each | 
				(ZnAWSS3Key fromXml: each) 
					bucket: bucket; 
					yourself ]) asArray