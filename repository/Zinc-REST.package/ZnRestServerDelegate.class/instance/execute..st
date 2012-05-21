public
execute: call
	^ [ call execute ]
		on: ZnRestCallUnauthorized 
		do: [ :exception | self unauthorized: exception request ]