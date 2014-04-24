responses
formTest1: request
	| input html |
	input := request uri queryAt: #input ifAbsent: [ 'input' ].
	html := '<h1>Form Test 1</h1>',
		'<form action="form-test-1" accept-charset="utf-8" method="get">',
		'Input <input type="input" name="input" value="{1}"> ',
		'<input type="submit"> for input <em>{1}</em>',
		'</form>' format: { input }.
	^ ZnResponse ok: (ZnEntity html: html )