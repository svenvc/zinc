private
evaluate: string
  | output |
  output := String
    streamContents: [ :out | 
      [ 
      | result |
      result := string evaluate.
      out
        print: result;
        cr ]
        on: Error
        do: [ :exception | 
          out
            nextPutAll: 'Error evaluating: ' , string printString;
            cr;
            print: exception;
            cr;
            nextPutAll: (GsProcess stackReportToLevel: 20) ].
      out cr ].
  ^ String lf join: output lines