package studentSurvey

class RouterController {

    def index() {
        //TODO napraviti prvjeru po roli da li je prof i da li je student
        log.debug("inside router index")
        redirect(controller: 'professor', action: 'list')
    }
}
