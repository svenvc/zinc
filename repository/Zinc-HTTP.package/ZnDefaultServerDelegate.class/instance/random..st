responses
random: request
	"Answer a text plain UTF-8 encoded string of random hex characters.
	Optionally take the size from the URI, as in /random/32 for 32 characters.
	Default to 64 characters with a newline at the end.
	We use a much faster 32-bit naive local integer only PRNG (a Lehmer / Park-Miller variant)"

	| count hexString randomState |
	count := Integer readFrom: request uri lastPathSegment ifFail: [ 64 ].
	randomState := (2 ** 32) atRandom.
	hexString := String new: count.
	1 to: count - 1 do: [ :each |
		hexString at: each put: ('0123456789ABCDEF' at: (randomState \\ 16) + 1).
		randomState := randomState * 48271 \\ 16r7fffffff ].
	hexString at: count put:	Character lf.
	^ ZnResponse ok: (ZnEntity text: hexString)