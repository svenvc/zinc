proxy
shouldProxyUrl: url
	"Even when a proxy is set, some URLs should not be proxied.
	There is no setting for this in the image.
	We exclude localhost and explicit exceptions from being proxied."

	^ self isProxySet
		and: [ 
			url isLocalHost not
				or: [ 
					[ (NetworkSystemSettings isAnExceptionFor: url) not ]
						on: MessageNotUnderstood
						do: [ true ] ] ]