accessing
html
	^ '<html><head><title>Image</title>
<body>
<h1>Image</h1>
<img src="image?raw=true"/>
<br/>
<form enctype="multipart/form-data" action="image" method="POST">
 <h3>Change the image:</h3>
 <input type="file" name="file"/>
 <input type="submit" value= "Upload"/>
</form>
</body></html>'