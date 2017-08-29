package studentSurvey

import org.springframework.dao.DataIntegrityViolationException

class QuestionController {

    def index() {}

    def list()
    {
        log.debug("inside question list")
    }

    def ajaxLoadQuestionTable()
    {
        List<Question> questionList = Question.list()
        log.debug("Lista Pitanja")
        questionList.each { question ->
            log.debug(question.id + " " + question.questionText)
        }

        render(template: "table", model: [questionList: questionList])
    }

    def show(Long id)
    {
//        Question question = Question.get(id)
//        log.debug(question.questionText)

        Question questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.error = "An error occurred, question does not exist"
            redirect(action: "list")
            return
        }

        return [questionInstance: questionInstance]
    }

    def create()
    {

    }

    def save()
    {
        log.debug("params")
        log.debug(params)

        Question q1 = new Question
                (
                        questionText: params.question
                )


        if (!q1.save(flush: true)) {
            flash.error = "Error on save!"
            redirect(controller: 'question', action: 'create', params: params)
            return
        }

        flash.message = "Save success!"
        redirect(controller: 'question', action: 'show', params: [id: q1.id])
        return

    }

    def edit()
    {
        log.debug("params u edit akciji")
        log.debug(params)

        Question q = Question.get(Long.valueOf(params.id))

        //TODO provjera da li postoji

        return [question: q]
    }

    def update()
    {
        log.debug("params u udpate akcij")
        log.debug(params)

        Question q = Question.get(Long.valueOf(params.id))

        //TODO provjera da li postoji, izbaciti grešku ako ne postoji

        q.questionText = params.question

        if (!q.save(flush: true))
        {
            log.debug("error occurred!")
            flash.error = "Error on update!"
            redirect(controller: 'question', action: 'edit', params: params)
            return
        }



        flash.message = "Update success!"
        redirect(controller: 'question', action: 'show', params: [id: q.id])
        return


    }

    def ajaxDeleteModal(Long id, String entityName, String controllerName, String actionName) {
        render(template: "/common/deleteModal", model: [entityId           : id,
                                                        entityName         : entityName,
                                                        requestedController: controllerName,
                                                        requestedAction    : actionName])
    }

    def delete(Long id)
    {
        Question q = Question.get(id)

        log.debug("dohvaceno pitanje")
        log.debug(q?.questionText)

        //TODO

        try
        {
            q.delete(flush: true)
            flash.message = "Delete success!"
            redirect(controller: 'question', action: 'list')
            return
        }
        catch (DataIntegrityViolationException e)
        {
            flash.error = "Error on delete!"
            redirect(controller: 'question', action: 'list')
            return

        }

    }

}