# Groovy / Grails Demo

Welcome to my simple groovy/grails tutorial! Here are some instructions for setting up groovy/grails and getting the sample code running. From there, the sample code has a lot of comments about what is going on. Also, the Grails app has some instructions to walk you through creating domains and controllers, as well as some general information about a running grails application.


## Installing Grails

Perform the following instructions to install Grails

* Download the Grails Zip from the [Grails Home Page](http://grails.org) (currnely version 1.3.7)
* Unzip to C:\apps\grails
* Click Start, right-click on My Computer and click Properties
* Under Advanced, click Environment Variables
* Under User Variables, click New
	* Variable Name: GRAILS_HOME
	* Variable Value: C:\apps\grails\grails-1.3.7
* Edit the Path Variable, add %GRAILS_HOME%\bin
* Open a new Command Prompt
* Type 'grails'. If something happens, you're done!

### Troubleshooting

If you do not get the expected results, make sure you also have Java installed and the %JAVA_HOME% environment variable created and added to your %PATH%.

-----

If you are looking to run groovy code outside of the grails web framework, you will also need the Groovy programming language installed. It comes by default with grails, so there is no need to worry about it when running grails.

## Installing Groovy

Perform the following instructions to install Groovy

* Download the Groovy Zip from the [Groovy Home Page](http://groovy.codehaus.org/) (currnely version 1.7)
* Unzip to C:\apps\groovy
* Click Start, right-click on My Computer and click Properties
* Under Advanced, click Environment Variables
* Under User Variables, click New
	* Variable Name: GROOVY_HOME
	* Variable Value: C:\apps\groovy\groovy-1.7
* Edit the Path Variable, add %GROOVY_HOME%\bin
* Open a new Command Prompt
* Type 'groovy'. If something happens, you're done!

-----

## Running the Grails sample-app

To run the grails sample-app application included with this tutorial, follow the following instructions:

* Download and extract the code. to a location on your hard drive
* Navigate to that location (inside of the sample-app directory) with the command prompt
* Type the following command
	
	grails run-app

* When the application starts up, it will give you a web address to type into your browser. Do this.

## Running the Groovy Sample Code (sample.groovy)

To run the sample.groovy file, simply navigate to the location of sample.groovy on your hard drive and type the following command:

	groovy sample.groovy
	
-----

Be sure to check the source of the grails application for comments explaining what the code is doing.

-----

## References

The following references are great resources for learning more about Groovy/Grails.

* [Groovy Beginner's Tutorial](http://groovy.codehaus.org/Beginners+Tutorial)
* [Grails Quick Start](http://grails.org/Quick+Start)
* [Groovy Recipes](http://pragprog.com/titles/sdgrvr/groovy-recipes) [Book]
* [Grails: A Quick Start Guide](http://pragprog.com/titles/dkgrails/grails) [Book]