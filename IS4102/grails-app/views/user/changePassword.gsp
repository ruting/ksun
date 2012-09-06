<%@ page import="khronosun.User" %>
<!doctype html>
<html>

  <head>
    <meta name="layout" content="main1">
    <title>Change Password</title>

    <script language="javascript" type="text/javascript">

        img0 = new Image();
        img1 = new Image();
        img2 = new Image();
        img3 = new Image();

        img0.src = '${resource(dir:'images/password',file:'tooshort.png')}';
        img1.src = '${resource(dir:'images/password',file:'weak.png')}';
        img2.src = '${resource(dir:'images/password',file:'medium.png')}';
        img3.src = '${resource(dir:'images/password',file:'strong.png')}';

//assign all image objects to an array
var images = Array( img0.src,img1.src,img2.src,img3.src);

//a function which will be called to update the password strength upn user key in new passwrd character
function strengthCheck( pw ) {

  //set the strength of password as 0
  var pwStrength = 0;

  // if password length is greater than 7 , increase the strength of password by 1
  if (pw.length > 7) {
    pwStrength++;
  }

  // if the password contains a small case or big case alphabet , increase the strength by 1
  if ( ( pw.match(/[a-z]/) ) && ( pw.match(/[A-Z]/) ) ) {
    pwStrength++;
  }

  // if the password contains a number , increase the strength by 1
  if (pw.match(/\d+/)) {
    pwStrength++;
  }

  // if the password contains special character , increase the strength by 1
  if ( pw.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) {
    pwStrength++;
    }

            document.getElementById( 'strength' ).src = images[ pwStrength ];
            document.getElementById('pstrength').value = pwStrength;

        }

    </script>

  </head>
  <body onload="document.getElementById( 'passwordNew' ).focus();"  >

    <div class="span8">
      <h3>Change Password</h3><br>
      <g:if test="${flash.message}">
        <div class="message">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;
    ${flash.message}</div><br>

      </g:if>

      <g:form action="changePasswordProcess"  enctype="multipart/form-data">
        <fieldset class="changePassword">
          <g:render template="changePassword"/>
        </fieldset>

        <fieldset class="buttons">
          <button class="btn btn-primary" type="submit">Change</button>
        </fieldset>
      </g:form>
    </div>
  </body>
</html>
