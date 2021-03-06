/**
 * Essential Groovy for Grails
 * Nick Nisi
 **/

/**
 * Grails Installation
 * Download the zip file from http://grails.org/ (version 1.3.7)
 *	Groovy comes with Grails, so no need to install it separately
 *	For the purpose of these instructions, I have downloaded and installed
 *	Grails to C:\grails\grails-1.3.7
 * Set environment variables
 *	GRAILS_HOME=C:\grails\grails-1.3.7
 *	JAVA_HOME=[location of Java on your machine]
 *	Add to your PATH Variable
 *	PATH=%PATH%;%GRAILS_HOME%\bin;
 * Open a command prompt, Type 'grails', if something happens, you're done!
 **/

/**
 * References
 * http://groovy.codehaus.org/Beginners+Tutorial
 * http://grails.org/doc/latest/
 * http://www.grails.org/Quick+Start
 **/

/********************************************************************/
// Strings and GStrings
println "\n\n===== String Test ====="
def name = 'Nick'
String str = "Nick";
def hello = "Hello, ${name}!"

def multiline = """
This is 
a multi-line string
isn't that cool?
"""
println multiline

println "name is of class ${name.class}"
println "hello is of class ${hello.class}"

// string comparison
if (name == str)
	println "These strings are identical"

if (name.equalsIgnoreCase(str))
	println "or you can do things the other way"

println "easily append strings -- $name"
println 'double ticks interpolate... single ticks do not -- $name'

/********************************************************************/
// Integers
println "\n\n===== Integer Test ====="
def x = 4
int y = 5;
z = x + y
println "z is ${x + y}"

/********************************************************************/
// groovy closures
// a closure is an executable block of code that can be assigned to a variable
println "\n\n===== Closure Test ====="
def c = { a, b -> a + b }
println 'executing c... ' + c(2,2)

def f = {
	println "This has been called ${it + 1} time(s)"
	// if not defined, the argument is 'it'
}
5.times(f) // call the closure 5 times

/********************************************************************/
// groovy collections

// list
println "\n\n ===== List Test ====="
def animals = ['cow', 'dog', 'cat']
animals << 'penguin'
animals.each {
	println "You've spotted a $it"
}
println "my favorite animal is ${animals[1]}"

// maps
println "\n\n===== Map Test ====="
def noises = [cow:'moo', dog:'woof', cat:'meow']
noises.each { animal, noise ->
	println "the $animal says $noise"
}

// set
// a set can't contain duplicates and
// can't be accessed from the subscript operator
println "\n\n===== Set Test ====="
def employees = ['Joe','Nick','Ben','Dan'] as Set
employees << 'Joe'
employees << 'Bob'
employees.each {
	println "$it is an employee"
}

// ranges
println "\n\n===== Range Test ====="
(1..3).each {
	println "$it..."
}
println "Go!"

/********************************************************************/
// Classes
println "\n\n===== Class Test ====="
class Cat {
	String name
	private String p = "foo"
	
	void doStuff() {
		println "I iz $name and I are programmer"
	}
}

def cat = new Cat()
// getters and setters are automatically created
cat.name = 'cletus'
cat.doStuff()
cat?.p = 'Hello' // private, can't be accessed
println cat?.p // not available

/********************************************************************/
// Operator Overloading
println "\n\n===== Operator Overloading Test ======"
class Tiger extends Cat {
	boolean equals(String n) {
		println "Calling my overloaded == method"
		name == n
	}
}

def m = new Tiger()
m.name = 'Tony'
if (m == 'Tony')
	println "these match!"

/********************************************************************/	
// dynamic typing
def cc = "Hello"
println "cc is of type ${cc.class}"
cc = 4
println "cc is of type ${cc.class}"