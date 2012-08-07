*zinc-http
/ aString 
	"Answer a FileDirectory on a subdirectory named aString, of the receiver."
	^ self class on: (self fullNameFor: aString)