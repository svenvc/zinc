*zinc-character-encoding-core
findFirstByteInString: aString inSet: inclusionMap startingAt: start
  "Trivial, non-primitive version"

  | i stringSize ascii more |
  inclusionMap size ~= 256
    ifTrue: [ ^ 0 ].
  i := start.
  stringSize := aString size.
  [ 
  i <= stringSize
    and: [ 
      ascii := aString basicAt: i.
      ascii < 256
        ifTrue: [ (inclusionMap at: ascii + 1) = 0 ]
        ifFalse: [ true ] ] ]
    whileTrue: [ i := i + 1 ].
  i > stringSize
    ifTrue: [ ^ 0 ].
  ^ i