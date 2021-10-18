I am ZnLimitedReadStream, wrapping another read stream delegating to it 
but limiting reading to a fixed number of elements.

I can be atEnd while my wrapped stream is not.

I am binary if the stream that I wrap is binary, else I am textual.
 
Part of Zinc HTTP Components.