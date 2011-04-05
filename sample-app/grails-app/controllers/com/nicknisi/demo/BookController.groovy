package com.nicknisi.demo

/**
 * This is the code generated from running the following comand:
 * grails generate-all org.example.Book
 * each closure (def [action] { ... }) corresponds to the URL for the page. For example,
 * if the url is http://localhost:8080/sample-app/book/list
 * It can be broken down as follows:
 * http://localhost:8080/sample-app // application location
 * /book/							// controller, corresponds to BookController
 * /list							// action, corresponds to the list action below 
 **/

/**
 * Each action listed below has a corresponding gsp file located in 
 * [root-dir]/grails-app/views/
 * The code below is executed and usually it returns a map of values,
 * which then the views use to display dynamic content.
 * other methods such as the save method, read in values passed in the params
 * object and complete actions such as saving to the database or updating something.
 **/

class BookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	// the above statement states which actions can be called from which HTTP method.
	// For example, save can only ever be called from an HTTP POST and never from HTTP GET

    def index = {
        redirect(action: "list", params: params) // redirects to list
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		// because this is the last item in the closure, this is what's returned.
		// remember, return statements are optional in Groovy.
		// Book.list is a provided method for the Book object.
		// There are a number of provided methods and variables.
		// see the grails documentation for more information
		// Take note that the corresponding list.gsp will have two variables
		// defined within it: bookInstanceList and bookInstanceTotal
		// check those comments to see how they are used.
        [bookInstanceList: Book.list(params), bookInstanceTotal: Book.count()]
    }

    def create = {
        def bookInstance = new Book()
        bookInstance.properties = params
        return [bookInstance: bookInstance]
    }

    def save = {
        def bookInstance = new Book(params)
        if (bookInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"
            redirect(action: "show", id: bookInstance.id)
        }
        else {
            render(view: "create", model: [bookInstance: bookInstance])
        }
    }

    def show = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookInstance: bookInstance]
        }
    }

    def edit = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookInstance: bookInstance]
        }
    }

    def update = {
        def bookInstance = Book.get(params.id)
        if (bookInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookInstance.version > version) {
                    
                    bookInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'book.label', default: 'Book')] as Object[], "Another user has updated this Book while you were editing")
                    render(view: "edit", model: [bookInstance: bookInstance])
                    return
                }
            }
            bookInstance.properties = params
            if (!bookInstance.hasErrors() && bookInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"
                redirect(action: "show", id: bookInstance.id)
            }
            else {
                render(view: "edit", model: [bookInstance: bookInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bookInstance = Book.get(params.id)
        if (bookInstance) {
            try {
                bookInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
    }
}
