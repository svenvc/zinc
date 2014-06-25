as yet unclassified
method: string
  | sym |
  sym := string asSymbol.
  method := ZnConstants knownHTTPMethods
    detect: [ :each | each = sym ]
    ifNone: [ (ZnUnknownHttpMethod method: string) signal ]