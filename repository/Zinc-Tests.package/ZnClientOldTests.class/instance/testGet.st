testing
testGet
	| response |
	response := [ ZnClientOld get: 'http://zn.stfx.eu/zn/small.html' ]
		on: Deprecation do: [ :ex | ex resume ].
	self assert: response isSuccess