<!doctype html>
<html>
  <head>
    <meta name="layout"/>
    <title>Add Event Image</title>

    <link href="${resource(dir:'css',file:'fileuploader.css')}" rel="stylesheet" type="text/css">

  <div id="image-uploader">
    <noscript>
      <p>Please enable JavaScript to use file uploader.</p>
      <!-- or put a simple form for upload here -->
    </noscript>
  </div>

  <script src="${resource(dir:'js',file:'fileuploader.js')}" type="text/javascript"></script>

<%-- Override the style in the file with the correct pathname --%>
  <style type="text/css">
    .qq-upload-spinner {
      display:inline-block;
      background: url("${resource(dir:'images',file:'loading.gif')}");
      width:15px;
      height:15px;
      vertical-align:text-bottom;
    }
  </style>

</head>
<body>
  <script>
function createUploader(){
var uploader = new qq.FileUploader({
element: document.getElementById('image-uploader'),
action: '<g:createLink controller="user" action="upload" id="${params.id}"  />',
multiple: true,
maxConnections: 1,
sizeLimit: 31457280, // 3 MB
allowedExtensions: [],
debug: false
});
}

// in your app create uploader as soon as the DOM is ready
// don't wait for the window to load
window.onload = createUploader;
  </script>
</body>
</html>
