<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'sample-app.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
	<!-- 
		This is the main layout. All of the pages will use this layout and their content will be injected into where the
		g:layoutBody tag is below. This makes it convenient to place navigation and other items that won't change from
		page to page
	 -->
		<% if (params.action != null) { 
			def firstLetter = params.controller.substring(0,1)
			def remainder = params.controller.substring(1)
			def controller = "${firstLetter.toUpperCase()}${remainder.toLowerCase()}"
		%>
		<div class="app-location">
			This page is controlled by <pre>def ${params.action}</pre> in
			[root-dir]/grails-app/controllers/[package structure]/${controller}Controller.groovy
		</div>
		<% } %>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
        <g:layoutBody />
    </body>
</html>