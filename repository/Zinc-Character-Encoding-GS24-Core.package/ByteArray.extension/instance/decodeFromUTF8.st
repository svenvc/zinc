*zinc-character-encoding-gs24-core
decodeFromUTF8

"Decode receiver from UTF8 format. 
 Returns either a Unicode7 , Unicode16 or Unicode32 ,
 using the minimum character size needed to represent decoded result."

^ self _decodeFromUtf8: true 
