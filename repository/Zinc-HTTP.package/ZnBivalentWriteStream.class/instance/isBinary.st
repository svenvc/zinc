private
isBinary

	binary
		ifNil: [ binary := [ stream isBinary ] on: MessageNotUnderstood do: [ :err | false ] ].
	^ binary