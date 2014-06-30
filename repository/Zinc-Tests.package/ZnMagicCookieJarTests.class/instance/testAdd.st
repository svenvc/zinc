testing
testAdd
  [ 
  | jar count |
  jar := ZnCookieJar new.
  count := jar cookies size.
  jar
    add: (ZnCookie fromString: self cookieString for: 'www.google.com' asZnUrl).
  self assert: jar cookies size = (count + 1) ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: ex description;
        cr;
        show: (GsProcess stackReportToLevel: 100) ]