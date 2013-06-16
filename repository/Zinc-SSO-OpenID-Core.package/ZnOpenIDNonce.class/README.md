I hold a parsed OpenID Nonce:

A string 255 characters or less in length, that MUST be unique to a successful authentication response. The nonce MUST start with the current time on the server, and MAY contain additional ASCII characters in the range 33-126 inclusive (printable non-whitespace characters), as necessary to make each response unique. The date and time MUST be formatted as specified in section 5.6 of [RFC3339], with the following restrictions:

All times must be in the UTC timezone, indicated with a "Z".
No fractional seconds are allowed
For example: 2005-05-15T17:11:51ZUNIQUE
