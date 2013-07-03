private request handling
handleNewPost: request
	| key contents first second sum |
	(request hasEntity and: [ request entity contentType = ZnMimeType applicationFormUrlEncoded ])
		ifFalse: [ ^ ZnResponse badRequest: request ].
	contents := request entity at: #contents.
	first := request session attributeAt: #firstNumber ifAbsent: [ 0 ]. 
	second := request session attributeAt: #secondNumber ifAbsent: [ 0 ]. 
	sum := Integer readFrom: (request entity at: #sum ifAbsent: [ ]) ifFail: [ 0 ].
	contents isEmpty | first isZero | second isZero | sum isZero | (first + second ~= sum) 
		ifTrue: [  ^ ZnResponse badRequest: request ].
	key := self generateNewKey.
	workspaces at: key put: contents.
	^ ZnResponse redirect: key