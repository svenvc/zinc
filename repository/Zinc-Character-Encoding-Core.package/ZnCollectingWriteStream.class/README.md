I am ZnCollectingWriteStream.

I am a write stream that collects what gets written to me.
I do not join everything flattened in an every growing collection.
Instead I collect the arguments as chunks, either elements, or collections of elements.
At the same time, I count the total number of elements.
When writing is done, I can more efficiently process these chunks, using #putOn: onto a stream, knowing the final size up front.
See #convertTo: for an example.

