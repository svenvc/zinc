ZnCRLFReadStream wraps a binary stream with any of the common line endings (CR, LF, CRLF) and converts them to CRLF.

RFC 2045 (https://tools.ietf.org/html/rfc2045) states that MIME documents use CRLF as the line end marker, however email documents as stored on disk often use the local line enging, e.g. LF.


Public API and Key Messages

- on: - supply the stream to be wrapped
- The public API is the standard Stream API

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	next:			<Integer>
	stream:		<BinaryStream>


    Implementation Points