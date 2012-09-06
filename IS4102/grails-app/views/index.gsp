<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main">
    <title>Sample title</title>
      <!-- Javascript -->
  <script type="text/javascript">

            // Results format for search autocomplete
            function formatResult(oResultData, sQuery, sResultMatch) {
              var sMarkup;
              var id = oResultData[1];
              var imageUri="${createLinkTo(dir:'/item/loadImage')}/" + id;

              if (sResultMatch) {
                sMarkup = "<img src="+imageUri+" class=\"avatar\" alt="+id+" style=\"width:60px; height: 45px;\"  /> " + sResultMatch
              } else {
                sMarkup = ""
              }
              return sMarkup;
            }
         </script>

  </head>
  <body>


      <div class="camera_wrap camera_grey_skin" id="camera_wrap_1">
            <div data-thumb=="${resource(dir:'images/slides/thumbs',file:'bridge.jpg')}" data-src="${resource(dir:'images/slides/',file:'bridge.jpg')}">
                <div class="camera_caption fadeFromBottom">
                    Camera is a responsive/adaptive slideshow. <em>Try to resize the browser window</em>
                </div>
            </div>
            <div data-thumb="${resource(dir:'images/slides/thumbs',file:'leaf.jpg')}" data-src="${resource(dir:'images/slides',file:'leaf.jpg')}">

                <div class="camera_caption fadeFromBottom">
                    It uses a light version of jQuery mobile, <em>navigate the slides by swiping with your fingers</em>
                </div>
            </div>
            <div data-thumb="${resource(dir:'images/slides/thumbs',file:'road.jpg')}" data-src="${resource(dir:'images/slides',file:'road.jpg')}">

                <div class="camera_caption fadeFromBottom">
                    <em>It's completely free</em> (even if a donation is appreciated)
                </div>
            </div>
            <div data-thumb="${resource(dir:'images/slides/thumbs',file:'sea.jpg')}" data-src="${resource(dir:'images/slides',file:'sea.jpg')}">

                <div class="camera_caption fadeFromBottom">
                    Camera slideshow provides many options <em>to customize your project</em> as more as possible
                </div>
            </div>
            <div data-thumb="${resource(dir:'images/slides/thumbs',file:'shelter.jpg')}" data-src="${resource(dir:'images/slides',file:'shelter.jpg')}">

                <div class="camera_caption fadeFromBottom">
                    It supports captions, HTML elements and videos and <em>it's validated in HTML5</em> (<a href="http://validator.w3.org/check?uri=http%3A%2F%2Fwww.pixedelic.com%2Fplugins%2Fcamera%2F&amp;charset=%28detect+automatically%29&amp;doctype=Inline&amp;group=0&amp;user-agent=W3C_Validator%2F1.2" target="_blank">have a look</a>)
                </div>
            </div>
            <div data-thumb="${resource(dir:'images/slides/thumbs',file:'tree.jpg')}" data-src="${resource(dir:'images/slides',file:'tree.jpg')}">

                <div class="camera_caption fadeFromBottom">
                    Different color skins and layouts available, <em>fullscreen ready too</em>
                </div>
            </div>
        </div><!-- #camera_wrap_1 -->


<!-- Pictures -->
<div class="row-fluid">
        <div class="span12">

        
    <ul class="thumbnails">
        <li class="span3">
          <div class="thumbnail">
            <img src="http://placehold.it/260x180" alt="">
            <div class="caption">
            </div>
          </div>
        </li>
        <li class="span3">
          <div class="thumbnail">
            <img src="http://placehold.it/260x180" alt="">
            <div class="caption">
            </div>
          </div>
        </li>
        <li class="span3">
          <div class="thumbnail">
            <img src="http://placehold.it/260x180" alt="">
            <div class="caption">
            </div>
          </div>
        </li>
        <li class="span3">
          <div class="thumbnail">
            <img src="http://placehold.it/260x180" alt="">
            <div class="caption">
            </div>
          </div>
        </li>
      </ul>
        </div> <!--End of span12 pictures-->
</div> <!--End of row-fluid pictures-->
        
  </body>
</html>
