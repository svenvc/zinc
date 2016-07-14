private
isListBucketResultTruncated: dom
	^ (dom root contentStringAt: 'IsTruncated') = 'true'