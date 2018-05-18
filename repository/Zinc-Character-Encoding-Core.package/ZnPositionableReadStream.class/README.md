I am ZnPositionableReadStream.
I am polymorphic with (the most used/important methods of) ReadStream and PositionableStream.

I wrap another read stream and store the elements that I read in a sliding circular buffer so that I am able to go back to any position inside that buffer. 

Essentially, I implement #position and #position: to be used to back out of reading ahead.

Note that the size of my buffer limits how far I can go backwards. A SubscriptOutOfBounds exception will be signalled when an attempt is made to go too far backwards.

The index returned by #position should be considered abstract, without concrete meaning, but it is currently implemented as the count of elements read by #next on the wrapped stream. On a simple stream over an in memory collection, that will be equivalent to an integer index into that collection. But on network streams or streams that were already further along, this will no longer be the case.

The most elementary example of my capabilities can be seen in my implementation of #peek. See also the unit tests #testPlainExcursion and #testSearch

Of course, backing out of an excursion is only possible within the window of the buffer size.

Implementation

- stream <ReadStream> the read stream that I wrap and add positioning to
- buffer <String|ByteArray> sliding, circular buffer
- index <PositiveInteger> zero based index into buffer, where next will be stored
- count <PositiveInteger> number of next operations done on wrapped stream
- delta <PositiveInteger> number of positions that I was moved backwards

The real core methods are #next, #atEnd, #position and #position: and are used to implement the rest.

Part of Zinc HTTP Components