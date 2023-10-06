I am ZnDataUrl, I implement the Data URI scheme as defined in RFC 2397.

I am like a URL/URI, but as an immediate value. As such I encapsulate a mime type and data. The data can optionally be base64 encoded, which is needed for non textual types.

Note that there is a difference between my external and internal representation. See #printOn: and #parseFrom:

References

- https://en.wikipedia.org/wiki/Data_URI_scheme
- https://datatracker.ietf.org/doc/html/rfc2397
