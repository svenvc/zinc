accessing-session
twitterSessionFor: aRequest ifAbsent: aBlock

	^ aRequest session attributeAt: 'twitter-session' ifAbsent: aBlock