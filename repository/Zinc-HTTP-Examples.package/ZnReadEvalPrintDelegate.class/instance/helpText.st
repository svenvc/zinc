private
helpText
	^ '# Pharo Smalltalk REPL. POST expressions to evaluate\# Example\curl -X POST -H''Content-Type:text/plain'' -d ''42 factorial'' http://localhost:1701/repl\# Here is another way (type ctrl-d to end input)\curl -X POST -H''Content-Type:text/plain'' --data-binary @- http://localhost:{1}/repl\'
			withCRs
				replaceAll: Character cr with: Character lf;
				yourself