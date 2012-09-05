<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  	<r:require modules="uploadr"/>
        <g:layoutHead/>
        <r:layoutResources />
        <resource:autoComplete skin="default" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!--to display the top header -->
    <g:render template="/common/header"/>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50" data-twttr-rendered="true">
    <!--to display the top header menu -->
    <g:render template="/common/headermenu"/>


<!-- declare the design as fluid. This ensure that the website will have proper proportions for key screen resolutions and devices (tablet,laptop,smartphone). -->
<div class="row-fluid">
  <!-- Bootstrap is built on a responsive 12-column .... Hence when designing a full page website, we declare it as span12 (act as a container) -->
  <div class="span12">

    <!--to display the left content -->
    <g:render template="/common/left"/>
    <g:layoutBody/>

    
    
  </div> <!-- /span12 -->
</div> <!-- /row-fluid  -->


<!--to display the footer -->
<g:render template="/common/footer"/>
<r:layoutResources />
</body>
</html>
