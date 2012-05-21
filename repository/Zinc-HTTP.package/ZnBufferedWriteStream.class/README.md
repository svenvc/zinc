I am ZnBufferedWriteStream.
I wrap a write stream and add buffering.

Make sure to always send me #flush or #close when you're done,
otherwise the last buffer might not yet have been written.

Part of Zinc HTTP Components.