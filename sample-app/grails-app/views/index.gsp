<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Application Status</h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>Installed Plugins</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Welcome to Grails</h1>
            <p>Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display whatever
            content you may choose. Below is a list of controllers that are currently deployed in this application,
            click on each to execute its default action:</p>
			
			<div class="nick-comment">
				<h1>Welcome to the Tutorial!</h1>
				<p>
					Welcome to the Grails Tutorial. I will try and point out as much as I can along the way.
					While navigating this web app, I will point out where in the source the code lives. This
					is the default home page. It does not have a controller controlling it. The file containing
					this text is located in [root-dir]/grails-app/views/index.gsp. I have added notes like this
					to other sections of the web app. I have also added the name of the action being run and the
					controller it is in on our generated pages. You will see this at the top of the page.
				</p>
				<p>
					One downside to Grails is that it generates an awful lot of CSS which you must either work around
					or eliminate. For the purposes of this tutorial, I have left the default CSS and markup alone, and
					am instead overriding where I need to. My custom CSS is located in [root-dir]/web-app/css/sample-app.css.
					My image is located in [root-dir]/web-app/images/gravatar.png.
				</p>
				<p>
					To the left of me, you will see the Application Status section, which will give you some insight
					about the version of grails you are running, the number of controllers and domains you've created,
					and a list of the installed plugins. For more information on plugins, please visit 
					<a href="http://www.grails.org/plugins/">http://www.grails.org/plugins/</a>
				</p>
				<p>
					Below me, you will see a list of the available controllers that have been generated. Controllers are
					generated with the <pre>grails create-controller</pre> command. The below controller is based upon the
					Quick Start tutorial located <a href="http://grails.org/Quick+Start">here</a>. I have followed this 
					quick start exactly, with one slight variation. Instead of using 
					<pre>grails generate-controller org.example.Book</pre>, I used 
					<pre>grails generate-all org.example.Book</pre>. If the former is used, and the tutorial is followed, 
					then the BookContorller.groovy file will simply contain <pre>def scaffold = Book</pre>. This does not
					allow for modification or viewing of the generated code.
				</p>
				<p>
					Now it's your turn. Try creating a new section for magazines. Open a new terminal to [root-dir] and type
					<pre>grails create-domain-class org.example.Magazine</pre> (note the capitalization of Magazine). Now,
					copy the same fields (author, title) from Book.groovy. Next, we will create the scaffold, which will provide
					us with the basic <a href="http://en.wikipedia.org/wiki/Create,_read,_update_and_delete">CRUD</a> methods
					to interact with our new domain. At the terminal, type <pre>grails create-controller org.example.Book</pre>.
					This will generate [root-dir]/grails-app-controllers/or.example.BookController.groovy. Open this file and add
					the following: <pre>def scaffold = Book</pre> and voila! Restart this grails app (hit <pre>CTRL+C</pre>
					and then type <pre>grails run-app</pre>) and then notice that MagazineController now appears below. Click on
					it to interact with it.
				</p>
				<p>
					Finally, let's generate all of the scaffold code so that it can be edited. Stop this app <pre>CTRL+C</pre>
					and then run the following command: <pre>grails generate-all org.example.Book</pre>. It will ask you if you
					would like to overwrite the current MagazineController.groovy file, select y[es]. Now navigate to
					[root-dir]/grails-app/controllers/org/example/MagazineController.groovy and notice all of the code that's
					been generated.
				</p>
				<p>
					For more information, be sure to check all of the source files for comments that describe what the file does.
				</p>
			</div>

            <div id="controllerList" class="dialog">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
