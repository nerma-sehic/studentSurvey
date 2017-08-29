package studentSurvey

import org.springframework.dao.DataIntegrityViolationException

class AnswerController {

    def index()
    {}

    def list()
    {
        log.debug("inside answer list")
    }

    def ajaxLoadAnswerTable()
    {
        List<Answer> answerList = Answer.list() //dohvatiti sve iz tablice
        log.debug("svi odgovori")
        answerList.each
                { answer ->
                    log.debug(answer.id + " " + answer.comment)

                }
        render(template: 'table', model: [answerList: answerList])
    }

    def show(Long id)
    {
        Answer answerInstance = Answer.get(id)
        if (!answerInstance)
        {
            flash.error = "An error occurred, answer does not exist"
            redirect(action: "list")
            return
        }
        return [answerInstance: answerInstance]
    }

    def create()
    {

    }

    def save()
    {
        log.debug("params")
        log.debug(params)

        Answer a1 = new Answer
                (
                        comment: params.comment,
                        value:  params.value,
                )


        if(!a1.save(flush: true))
        {
            flash.error="Error on save!"
            redirect(controller: 'answer', action: 'create', params: params)
            return
        }

        flash.message="Save success!"
        redirect(controller: 'answer', action: 'list', params: [id: a1.id])
        return



    }

    def edit()
    {

        log.debug("params u edit akciji")
        log.debug(params)

        Answer a = Answer.get(Long.valueOf(params.id))

        //TODO provjera da li postoji

        return [answer: a]
    }

    def update()
    {

        log.debug("params u udpate akcij")
        log.debug(params)

        Answer a = Answer.get(Long.valueOf(params.id))

        //TODO provjera da li postoji, izbaciti grešku ako ne postoji

        if (a.comment)
            {
                a.comment = params.comment
            }
        else
        {
            a.value = params.value.toInteger()
        }


        if(!a.save(flush: true))
        {
            log.debug("error occurred!")
            flash.error="Error on update!"
            redirect(controller: 'answer', action: 'edit', params: params)
            return
        }

        flash.message="Update success!"
        redirect(controller: 'answer', action: 'list', params: [id: a.id])
        return


    }


    def ajaxDeleteModal(Long id, String entityName, String controllerName, String actionName)
    {
        render(template: "/common/deleteModal", model:[entityId:id,
                                                       entityName: entityName,
                                                       requestedController:controllerName,
                                                       requestedAction:actionName])
    }

    def delete(Long id)
    {

        Answer a = Answer.get(id)

        log.debug("dohvaceni odgovor")
        log.debug(a?.comment)
        log.debug(a?.value)

        //TODO

        try
        {
            a.delete(flush: true)
            flash.message="Delete success!"
            redirect(controller: 'answer', action: 'list')
            return
        }
        catch (DataIntegrityViolationException e)
        {
            flash.error="Error on delete!"
            redirect(controller: 'answer', action: 'list')
            return

        }



    }
}
