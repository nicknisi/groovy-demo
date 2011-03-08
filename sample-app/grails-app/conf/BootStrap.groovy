import org.example.Book

class BootStrap {
	/**
	 * BootStrap.groovy
	 * The init closure below will be called once when the application is started
	 * and the destroy closure will be run once when the application is closed.
	 * Here, I am using the init closure to create new instances of the Book object and
	 * then calling save(), which will save them in the in-memory database.
	 **/

    def init = { servletContext ->
		if (!Book.count()) {
			new Book(author:"Stephen King", title:"The Shining").save(failOnError:true)
			new Book(author:"James Patterson", title:"Along Came a Spider").save(failOnError:true)
		}
    }
    def destroy = {
    }
}
