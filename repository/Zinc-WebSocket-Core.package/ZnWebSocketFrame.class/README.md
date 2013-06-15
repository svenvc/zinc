I am ZnWebSocketFrame, the elementary, low-level unit of data transfer in the WebSocket protocol.

A frame has an opcode (a type), a flag indicating whether it is the final frame in a sequence, a flag indicating whether it is masked and a body (a ByteArray).

The wire encoding of a frame consists minimally of 2 bytes: the first holds the opcode and final bit, the second the size and masked bit. Sizes strictly smaller than 126 are encoded directly. If the first byte is 126, the size is encoded in 2 successive bytes. If the first byte is 127, the size is encoded in 8 successive bytes. Client to server messages are masked. A 4 byte mask is XOR-ed with all body bytes. See #readFrom: and #writeOn: for the details.

This implementation follows RFC 6455. See also:

	http://en.wikipedia.org/wiki/Websockets
	http://tools.ietf.org/html/rfc6455

Part of Zinc HTTP Components.