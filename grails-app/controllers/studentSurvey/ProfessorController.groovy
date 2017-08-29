package studentSurvey

import org.springframework.dao.DataIntegrityViolationException

class ProfessorController {

    def index()
    {

    }

    def list()
    {
        log.debug("inside professor list")
    }


    def ajaxLoadProfessorsTable()
    {
        List<Professor> professorList = Professor.list([sort: 'firstName', order: 'asc']) //dohvatiti sve iz tablice
        log.debug("svi profesori")
        professorList.each
                { prof ->
                  log.debug(prof.firstName + " " + prof.lastName)

                }
        render(template: 'table', model: [professorList: professorList])
    }

    def show(Long id)
    {
        Professor professorInstance = Professor.get(id)

        List<Subject> subjectList = Subject.list()
        List<Subject> currentSubjectsList = []

        if (!professorInstance)
        {
            flash.error = "An error occurred, professor does not exist"
            redirect(action: "list")
            return
        }

        List<ProfessorSubject> ps = ProfessorSubject.findAllByProfessorID(professorInstance.id)

        ps.each {red ->
            Subject dohvaceniPredmet = Subject.get(red.subjectID)
            currentSubjectsList.add(dohvaceniPredmet)
        }
        return [professorInstance: professorInstance, subjectList: subjectList, currentSubjectsList: currentSubjectsList]
    }

    def create()
    {
        List<Subject> subjectList = Subject.list()
        List<Subject> currentSubjectsList = []

        return [subjectList: subjectList, currentSubjectsList: currentSubjectsList]
    }

    def save()
    {
        log.debug("params")
        log.debug(params)

        List addedSubjectsList = params.list('toTemplates')
        Professor p = Professor.findByEMail(params.email)

        if(p)
        {
            flash.error="Professor with this email already exists!"
            redirect(controller: 'professor', action: 'create', params: params)
            return
        }

        Professor p1 = new Professor(
                firstName: params.firstname,
                lastName:  params.lastname,
                address: params.address,
                cellPhone: params.cellphone,
                eMail: params.email,
        )


        if(!p1.save(flush: true))
        {
            flash.error="Error on save!"
            redirect(controller: 'professor', action: 'create', params: params)
            return
        }

        if (addedSubjectsList){
            addedSubjectsList.each { addedSubject ->
                ProfessorSubject ps = new ProfessorSubject(professorID: p1?.id, subjectID: Long.valueOf(addedSubject))
                if (!ps.save(flush: true)){
                    flash.error = "An error occurred while saving added subjects!"
                }
            }
        }

        flash.message="Save success!"
        redirect(controller: 'professor', action: 'show', params: [id: p1.id])
        return

    }

    def edit()
    {

        log.debug("params u edit akciji")
        log.debug(params)

        Professor p = Professor.get(Long.valueOf(params.id))

        List<Subject> subjectList = Subject.list()

//        List<Subject> subjectList = Subject.findAllByOdsjek("IT")

        List<Subject> currentSubjectsList = []

        List<ProfessorSubject> ps = ProfessorSubject.findAllByProfessorID(p.id)

        ps.each {red ->
            Subject dohvaceniPredmet = Subject.get(red.subjectID)
            currentSubjectsList.add(dohvaceniPredmet)
        }

        log.debug("dohvaceni predmeti:")
        currentSubjectsList.each {d ->
            log.debug(d.name)
        }

//        return [subjectList: subjectList, currentSubjectsList: currentSubjectsList]

        //TODO provjera da li postoji


        return [prof: p, subjectList: subjectList, currentSubjectsList: currentSubjectsList]
    }

    def update()
    {
        log.debug("params u update akciji")
        log.debug(params)

        List addedSubjectsList = params.list('toTemplates')
        Professor p = Professor.get(Long.valueOf(params.id))

        p.address = params.address
        p.firstName = params.firstname
        p.lastName = params.lastname
        p.cellPhone = params.cellphone
        p.eMail = params.email

        if(!p.save(flush: true))
        {
            log.debug("error occurred!")
            flash.error="Error on update!"
            redirect(controller: 'professor', action: 'edit', params: params)
            return
        }


        List<ProfessorSubject> ps = ProfessorSubject.findAllByProfessorID(p.id)
        ps.each {
            it.delete(flush: true)
        }

        if (addedSubjectsList){
            addedSubjectsList.each { addedSubject ->
                ProfessorSubject ps1 = new ProfessorSubject(professorID: p?.id, subjectID: Long.valueOf(addedSubject))
                if (!ps1.save(flush: true)){
                    flash.error = "An error occurred while saving added subjects!"
                }
            }
        }

        flash.message="Update success!"
        redirect(controller: 'professor', action: 'show', params: [id: p.id])
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

        Professor p = Professor.get(id)

        log.debug("dohvaceni prof")
        log.debug(p?.firstName)

        try
        {
            p.delete(flush: true)
            flash.message="Delete success!"
            redirect(controller: 'professor', action: 'list')
            return
        }
        catch (DataIntegrityViolationException e)
        {
            flash.error="Error on delete!"
            redirect(controller: 'professor', action: 'list')
            return

        }



    }


}
