package org.example

/**
 * Book
 * This is a domain object, or model.
 * This corresponds to a table in the database.
 * For the purpose of this tutorial, we are using the in-memory
 * database, and populating it with the init closure inside of BootStrap.groovy.
 * Each one of the variables listed below corresponds to a column in a database table called
 * book. This is configured in the DataSource.groovy file.
 **/

class Book {
	String title // VARCHAR title
	String author // VARCHAR author
	// not pictured, are the index (a unique identifier), creation date, and updateDate,
	// these are added to every Grails domain by default and do not need to be represented
	// here. You will not need to worry about setting these, as they will automatically be
	// set by Grails.

    static constraints = {
		title(blank:false)
		author(blank:false)
    }
}
