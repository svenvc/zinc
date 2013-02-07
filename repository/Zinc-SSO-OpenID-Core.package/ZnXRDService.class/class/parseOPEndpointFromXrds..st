parsing
parseOPEndpointFromXrds: aString

	| xmlNode |

	xmlNode := self xmlParser parse: aString.
	xmlNode := xmlNode root elementAt: 'XRD'.
	xmlNode := xmlNode elementAt: 'Service'.
	^xmlNode contentStringAt: 'URI'