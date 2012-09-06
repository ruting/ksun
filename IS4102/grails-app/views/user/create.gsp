<%@ page import="khronosun.User" %>
<!doctype html>
<html>

	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

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
		<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-user" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save"  enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                                
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
