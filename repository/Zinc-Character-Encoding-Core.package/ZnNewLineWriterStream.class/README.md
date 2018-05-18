I am a write stream wrapping a second stream. Whenever they ask me to write a cr, a lf, or a crlf I'll instead print a new line depending on a configured convention. By default I use the current platform convention. 

stream := '' writeStream.
converter := ZnCrPortableWriteStream on: stream.
converter cr; cr; lf; nextPut: $a.
stream contents

A ZnCrPortableWriteStream can be configured with the desired line ending convention using the methods 

converter forCr.
converter forLf.
converter forCrLf.
converter forPlatformLineEnding.