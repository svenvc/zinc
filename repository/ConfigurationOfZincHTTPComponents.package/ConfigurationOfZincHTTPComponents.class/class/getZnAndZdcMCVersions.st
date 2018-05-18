accessing
getZnAndZdcMCVersions
	^ (MCWorkingCopy allManagers collect: #description) 
			select: [ :each | ('*Zinc*' match: each) or: [ '*Zodiac*' match: each ]] 
			thenCollect: #asString