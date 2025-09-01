private
process: process on: html
	"Render a processes on html"
	
	html 
		str: process name; space; 
		nextPut: $[; print: process priority; nextPut: $]