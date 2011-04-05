
<%@ page import="com.nicknisi.demo.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'book.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
					<!-- 
						below we are using the bookInstanceList variable, which was returned in the map in the list closure
						inside of BookController.groovy.
					-->
                    <g:each in="${bookInstanceList}" status="i" var="bookInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "author")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
