instance creation
fromUrl: anUrl

	^self new initializeWith: (
		NeoJSONReader fromString: (
			ZnClient new
				accept: ZnMimeType applicationJson ;
				get: anUrl))