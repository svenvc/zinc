instance creation
fromUrl: anUrl

	^self new initializeWith: (
		ZnUtils defaultJSONReader fromString: (
			ZnClient new
				accept: ZnMimeType applicationJson ;
				get: anUrl))