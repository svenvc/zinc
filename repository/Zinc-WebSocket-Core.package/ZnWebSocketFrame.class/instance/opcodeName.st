accessing
opcodeName
	| name |
	self assert: (opcode between: 0 and: 15).
	name := #(continuation text binary nil nil nil nil nil close ping pong nil nil nil nil nil) at: opcode + 1.
	^ name ifNil: [ opcode asString ] ifNotNil: [ name ]