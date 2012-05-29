*zinc-http
readFrom: aStream base: base 
	"Answer an instance of one of the concrete subclasses if Integer. 
	Initial minus sign accepted, and bases > 10 use letters A-Z.
	Imbedded radix specifiers not allowed;  use Number 
	class readFrom: for that. Answer zero if there are no digits."

| stream factor result dv  |
factor := 1.
result := 0.
stream:=aStream isStream ifTrue:[aStream] ifFalse:[aStream readStream].
(stream peek isEquivalent: $-)
ifTrue: [
  stream next.
  factor := -1.]
ifFalse: [
  (stream peek isEquivalent: $+) ifTrue: [
    stream next]].
[ stream atEnd not and: [ (dv := stream peek digitValueInRadix: base) ~~ nil ] ] whileTrue: [
  stream next.
  result := result * base + dv.
].

^ result * factor