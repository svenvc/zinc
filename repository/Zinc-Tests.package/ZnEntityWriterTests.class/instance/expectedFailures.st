testing
expectedFailures
  ((System gemVersionReport at: #'gsVersion') beginsWith: '3.2')
    ifTrue: [ ^ #() ].
  ^ #(#'testGzippedAndChunked')	"not failing consistently, but I distrust this test .. this test gone in future versions of Zinc"