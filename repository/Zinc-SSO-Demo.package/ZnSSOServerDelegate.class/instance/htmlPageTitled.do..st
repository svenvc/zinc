private
htmlPageTitled: title do: block
	^ String streamContents: [ :stream |
		stream 
			<< '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>';
			<< title;
			<< '</title>
<style type="text/css">
body {
  color: black;
  background: white;
  width: 900px;
  font-family: Verdana, Arial, Helvetica, sans-serif;
  font-size: 13px;
}
p {
  width: 600px;
  padding: 0 5px 10px 0px;
} 
ul,ol {
  width: 600px;
  padding: 0 5px 5px 30px;
} 
#logo {
  color: orange;
  font-family: Helvetica, sans-serif;
  font-weight: bold;
  font-size: 100px;
}
</style>
</head>
<body>
<div id="logo">Zn</div>
<h1>'; 
			<< title; 
			<<'</h1>'. 
		block value: stream. 
		stream << '</body></html>' ]