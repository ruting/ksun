  <div class="container-fluid">

    <!-- nav-bar -->
    <div class="navbar">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="${createLink(uri: '/')}">(K)</a>
          <div class="nav-collapse">

            <ul class="nav">
              <li class="divider-vertical"></li>
              <li class="divider-vertical"></li>
              <li class="divider-vertical"></li>
              <li class="active"><g:link controller="Category" action="list"> Store </g:link></li>

              <li class="divider-vertical"></li>
              <li><a href="#">Latest Products</a></li>
              <li class="divider-vertical"></li>
              <li><a href="http://localhost:8080/khronosun/user/diy">DIY Products</a></li>
              <li class="divider-vertical"></li>
              <li><a href="#">All Time Favorites</a></li>
              <li class="divider-vertical"></li>

               <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Category <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><g:link controller="Category" action="list">Show All Category</g:link></li>
                  <g:each in="${khronosun.Category.list()}" status="i" var="category">
                    <li><g:link controller="Category" action="show" params="[id:category.id]">${category.categoryType}</g:link></li>
                    </g:each>
                </ul> <!-- /.dropdown-menu -->
              </li> <!-- /.dropdown -->
              <li class="divider-vertical"></li>
              <li class="divider-vertical"></li>
              <li class="divider-vertical"></li>
            </ul> <!-- /.nav -->


            <ul class="nav pull-right">
              <li class="divider-vertical"></li>
              <li class="divider-vertical"></li>
              <li class="divider-vertical"></li>

              <g:if test="${session?.user}">
                <li><g:link controller="User" action="changePassword"  >Change Password</g:link></li>
                <li><g:link controller="User" action="logout"  >Logout</g:link></li>
              </g:if>
              <g:else>

                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-user"></i>Login<b class="caret"></b></a>
                  <div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">

                    <g:form class="dialog" url="[controller:'user',action:'login']">
                      <div class="dialog">

                        <g:if test="${flash.message}">
                          <div class="message">${flash.message}</div>
                        </g:if>

                        <tr class="prop">
                          <td valign="top" class="email">
                            <label for="username">Email</label>
                            <div class="email">
                              <g:textField name="email" />
                            </div>
                          </td>
                        </tr>

                        <tr class="prop">
                          <td valign="top" class="name">
                            <label for="password">Password</label>
                            <div class="name">
                              <g:passwordField name="password" />
                            </div>
                          </td>
                        </tr>

                        <tr class="prop">
                          <td valign="top" class="name">
                        <g:submitButton class="orangeButton" name="submitButton" value="Sign In" />
                        </td>
                        </tr>

                        <tr class="prop">
                          <td valign="top" class="name">
                        <g:actionSubmit name="forgetPassword" value="Forget Password" action="forgetPassword"  />
                        </td>
                        </tr>

                        <p></p>
                        <tr class="prop">
                          <td valign="top" class="name">Don't have an account?
                        <g:link controller="user" action="register" class="nav0">
                          Sign up now!
                        </g:link>
                        </td>
                        </tr>
                      </div>
                    </g:form>
                  </div>
              </g:else>
            </li>  <!-- dropdown -->


            <g:form class="navbar-search ">
              <richui:autoComplete class="search-query span1" name="item" action="${createLinkTo('dir': 'item/searchAJAX')}" onItemSelect="document.location.href = '${createLinkTo(dir: 'item/show')}/' + id;" formatResult="formatResult"/>
            </g:form>
            </ul>
            <ul class="nav pull-right">
            </ul> <!-- /.nav -->


          </div><!-- /.nav-collapse -->
        </div>
      </div><!-- /navbar-inner -->
    </div>
    <!-- /navbar -->

    <div class="row-fluid">
      <div class="span12">