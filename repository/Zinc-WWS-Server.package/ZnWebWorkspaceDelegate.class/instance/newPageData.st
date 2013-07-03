private html
newPageData
	^ '
<head>
<title>Create A New Shared Smalltalk Workspace</title>
<link href="http://stfx.eu/wws/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<h1>Create A New Shared Smalltalk Workspace</h1>

<form method="POST" action="new">
<textarea 
  name="contents" class="smalltalk"
  rows="20" cols="60" 
  placeholder="
Go ahead and type or paste Smalltalk code. 
Answer the Captcha and press Create when you are done. 
Once created, a workspace is readonly and can no longer be edited. 
If anything goes wrong, use your Browser''s Back button.
">
</textarea>
<div class="toolbar">
  <a href="/">Home</a>
  | <a href="1WS4U">Getting Started Workspace</a>
  | {captcha}
  | <input type="submit" value="Create"</a>
</div>
</form>
'