testing
matches: aMimeType
	"aMimeType is the pattern to match, it is a normal instance where main or sub can be wildcards"
	^ (aMimeType main = '*'
		or: [ aMimeType main = self main ])
		and: [
			aMimeType sub = '*'
				or: [ aMimeType sub = self sub ] ]