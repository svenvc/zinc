as yet unclassified
readFrom: stream
	| line lineStream |
	line := (ZnLineReader on: stream) nextLine.
	lineStream := line readStream.
	self method: (lineStream upTo: Character space) withBlanksTrimmed.
	self uri: (lineStream upTo: Character space) withBlanksTrimmed.
	self version: (lineStream upToEnd)