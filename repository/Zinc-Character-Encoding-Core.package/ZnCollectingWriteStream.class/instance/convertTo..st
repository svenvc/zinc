converting
convertTo: species
	"Convert the chunks that I collected into a collection of type species.
	Since I known the total size I can do this more efficiently."

	^ species new: totalSize streamContents: [ :out |
		chunks do: [ :each | each putOn: out ] ]