I am ZnLossyUTF8Decoder.
I am a ZnUTF8Decoder.

I behave like my superclass but will not signal errors when I see illegal UTF-8 encoded input,
instead I will output a Unicode Replacement Character (U+FFFD) for each error.

In contrast to my superclass I can read any random byte sequence, decoding both legal and illegal UTF-8 sequences.

 Due to my stream based design and usage as well as my stateless implementation, 
 I will output multiple replacement characters when multiple illegal sequences occur.
 
 My convenience method #decodeBytesSingleReplacement: shows how to decode bytes so that 
 only a single replacement character stands for any amount of illegal encoding between legal encodings.
 
 When I encounter an illegal code point while writing, I output the encoding for the replacement character.
 
Part of Zinc HTTP Components.