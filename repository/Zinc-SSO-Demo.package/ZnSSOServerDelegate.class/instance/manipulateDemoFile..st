private
manipulateDemoFile: dropboxUserAccess
	"A little DropBox file manipulation demo."
	
	| demoFilePath contents id |
	demoFilePath := #( 'demo.txt' ).
	contents := [ dropboxUserAccess getFile: demoFilePath ] on: Error do: [ nil ].
	id := 0.
	contents ifNotNil: [ 
		contents linesDo: [ :line | | tokens |
			tokens := $: split: line.
			(tokens size >= 2 and: [ tokens first trimBoth = 'id' ])
				ifTrue: [ id := Integer readFrom: tokens second trimBoth ifFail: [ 0 ] ] ] ].
	id := id + 1.
	contents := String streamContents: [ :out |
		out << 'file:demo.txt'; crlf.
		out << 'description:created & updated automatically by ZnSSOServerDelegate>>#manipulateDemoFile:'; crlf.
		out << 'timestamp:'; print: DateAndTime now; crlf.
		out << 'id:'; print: id; crlf ].
	dropboxUserAccess putFile: demoFilePath data: (ZnEntity text: contents).
	^ id 
	