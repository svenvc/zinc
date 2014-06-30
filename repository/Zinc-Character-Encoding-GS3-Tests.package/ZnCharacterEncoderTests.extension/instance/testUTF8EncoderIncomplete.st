*zinc-character-encoding-gs3-tests
testUTF8EncoderIncomplete
  "The examples are taken from http://en.wikipedia.org/wiki/UTF-8#Description"

  | gsVersion encoder |
  gsVersion := System gemVersionReport at: 'gsVersion'.
  ((gsVersion beginsWith: '3.1') or: [ gsVersion beginsWith: '3.0' ])
    ifTrue: [ ^ self ].
  encoder := ZnUTF8Encoder new.
  #(#(16rC2 16rA2) #(16rE2 16r82 16rAC) #(16rF0 16rA4 16rAD 16rA2))
    do: [ :each | 
      2 to: each size do: [ :count | 
        self
          should: [ encoder decodeBytes: (each allButLast: count - 1) ]
          raise: ZnInvalidUTF8 , ArgumentError ] ]