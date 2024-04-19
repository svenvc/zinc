accessing
ignoreByteOrderMark
	"Return true when I ignore Unicode byte-order mark (BOM) occurences that I read (the default)."
	
	^ ignoreByteOrderMark ifNil: [ ignoreByteOrderMark := true ]