I am ZnBufferedReadWriteStream.
I wrap a buffered read stream and a buffered write stream on the same file.

I discard my read buffer on writes, and flush my write buffer on reads.
Make sure to always send me #flush or #close when you're done,
otherwise the last buffer might not yet have been written.
My class side's #on:do: helps to ensure this.

I can wrap both binary or character streams and act accordingly.

Part of Zinc HTTP Components.