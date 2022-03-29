*Zinc-Resource-Meta-Core
addedToZnUrl: url
	| segments |
	segments := self findTokens: '/'.
	^ url withPathSegments: segments