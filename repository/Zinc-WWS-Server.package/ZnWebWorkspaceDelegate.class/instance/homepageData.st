private html
homepageData
	^ '
<head>
<title>Shared Smalltalk Workspaces</title>
<link href="http://stfx.eu/wws/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<h1>Shared Smalltalk Workspaces</h1>
<h3>Hello and welcome to http://ws.stfx.eu,</h3>
<h3>a free web service to share Smalltalk workspaces.</h3>

<div class="intro">
<p>
This website offers a web service to easily <b>share Smalltalk workspaces</b>.
</p>
<p>
It is a <a href="http://en.wikipedia.org/wiki/Pastebin">pastebin</a> for Smalltalk.
</p>
<p>
Using the standard Workspace <b>GTPlayground</b>,
you can easily <b>publish the contents of any workspace to this website/webservice</b>.
</p>
<p>
Each time you publish a workspace, you will create a new shared web workspace.
Each shared web workspace is identified by a unique key.
Keys look like 6DKGPHMWVMI8. The <b>unique, official URL</b> to the shared workspace
for that key then becomes http://ws.stfx.eu/6DKGPHMWVMI8.
</p>
<p>
To actually <b>share the workspace</b> you can <b>pass the URL around</b> in any message.
Recepients will then be able to <b>open the shared workspace using a web browser</b>.
The HTML page generated will apply Smalltalk aware syntax highlighting to the contents.
</p>
<p>
Alternatively, recipients of a shared workspace URL or key can <b>use Spotter or GTPlayground
to open the contents right in an image</b>, ready to be used.
</p>
<p>
For instructions on how to begin, see the <a href="1WS4U">Getting Started Workspace</a>.
</p>
<p>
You can also create a shared workspace using <b>a simple web interface</b> where you can directly type or paste text, see <a href="new">New</a>.
</p>
<p>
All information published via this service is public.
The keys in the URLs are random and hard to guess, 
so unless someone knows the URL/key they won''t be able to access the workspace.
We promise not to further share workspaces by publishing indexes or making their contents searcheable.
This service is currently in beta.
Workspaces are not guaranteed to be persistent,
although every effort is made to offer a good service.
</p>
<p>
When serving a workspace''s contents, the Accept HTTP header will normally determine the resulting response''s content.
Browser HTTP agents that normally indicate that they prefer HTML content will receive a full, decorated HTML page.
Non-browser HTTP agents will receive plain, undecorated text content. 
A custom Accept header can be used to control the response.
Additionally, adding a query parameter format=html or format=text to the URL will override this behavior. 
</p>
<p>
Once created, shared workspaces are read-only. They can neither be modified, nor deleted.
Little used workspaces will eventually be removed after some period of time.
The maximum size for workspaces is limited to 2Kb. 
Any line end convention as well as ASCII, Latin1 and UTF-8 encoding are supported for incoming data.
Workspaces are always served using the Unix line end convention and UTF-8 encoding.
</p>
</div>
'