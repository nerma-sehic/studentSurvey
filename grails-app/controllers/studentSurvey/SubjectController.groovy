package studentSurvey

import org.springframework.dao.DataIntegrityViolationException

class SubjectController {

    def index()
    {}

    def list()
    {
        log.debug("inside subject list")
    }

    def ajaxLoadSubjectTable()
    {
        List<Subject> subjectList = Subject.list([sort: 'name', order: 'asc']) //dohvatiti sve iz tablice
        log.debug("svi kolegiji")
        subjectList.each
                { subject ->
                    log.debug(subject.id + " " + subject.name)
                }
        render(template: 'table', model: [subjectList: subjectList])
    }

    def show(Long id)
    {
        Subject subjectInstance = Subject.get(id)

        List<Professor> professorList = Professor.list()
        List<Professor> currentProfessorList = []

        if (!subjectInstance)
        {
            flash.error = "An error occurred, subject does not exist"
            redirect(action: "list")
            return
        }

        List<ProfessorSubject> ps = ProfessorSubject.findAllBySubjectID(subjectInstance.id)

        ps.each {red ->
            Professor dohvaceniPofesor = Professor.get(red.professorID)
            currentProfessorList.add(dohvaceniPofesor)
        }
        return [subjectInstance: subjectInstance, professorList: professorList, currentProfessorList: currentProfessorList]
    }

    def create()
    {
        List<Professor> professorList = Professor.list()
        List<Professor> currentProfessorList = []

        return [professorList: professorList, currentProfessorList: currentProfessorList]
    }

    def save()
    {
        log.debug("params")
        log.debug(params)

        List addedProfessorList = params.list('toTemplates')
        Subject s = Subject.findByName(params.name)

        if(s)
        {
            flash.error="Subject with this name already exists!"
            redirect(controller: 'subject', action: 'create', params: params)
            return
        }

        Subject s1 = new Subject
                (
                        name: params.name,
                        ects: params.ects,
                )

        if(!s1.save(flush: true))
        {
            flash.error="Error on save!"
            redirect(controller: 'subject', action: 'create', params: params)
            return
        }

        if (addedProfessorList){
            addedProfessorList.each { addedProfessor ->
                ProfessorSubject ps = new ProfessorSubject(subjectID: s1?.id, professorID: Long.valueOf(addedProfessor))
                if (!ps.save(flush: true)){
                    flash.error = "An error occurred while saving added subjects!"
                }
            }
        }

        flash.message="Save success!"
        redirect(controller: 'subject', action: 'show', params: [id: s1.id])
        return
    }

    def edit()
    {

        log.debug("params u edit akciji")
        log.debug(params)

        Subject s = Subject.get(Long.valueOf(params.id))

        List<Professor> professorList = Professor.list()

//        List<Subject> subjectList = Subject.findAllByOdsjek("IT")

        List<Professor> currentProfessorList = []

        List<ProfessorSubject> ps = ProfessorSubject.findAllBySubjectID(s.id)

        ps.each {red ->
            Professor dohvaceniProfesor = Professor.get(red.professorID)
            currentProfessorList.add(dohvaceniProfesor)
        }

        log.debug("dohvaceni profesori:")
        currentProfessorList.each {d ->
            log.debug(d.firstName + " " + d.lastName)
        }

        //TODO provjera da li postoji

        return [subject: s, professorList: professorList, currentProfessorList: currentProfessorList]
    }

    def update()
    {
        log.debug("params u udpate akcij")
        log.debug(params)

        List addedProfessorList = params.list('toTemplates')
        Subject s = Subject.get(Long.valueOf(params.id))

        //TODO provjera da li postoji, izbaciti grešku ako ne postoji

        s.name = params.name
        s.ects = params.ects.toInteger()

        if(!s.save(flush: true))
        {
            log.debug("error occurred!")
            flash.error="Error on update!"
            redirect(controller: 'subject', action: 'edit', params: params)
            return
        }

        List<ProfessorSubject> ps = ProfessorSubject.findAllBySubjectID(s.id)
        ps.each {
            it.delete(flush: true)
        }

        if (addedProfessorList){
            addedProfessorList.each { addedProfessor ->
                ProfessorSubject ps1 = new ProfessorSubject(subjectID: s?.id, professorID: Long.valueOf(addedProfessor))
                if (!ps1.save(flush: true)){
                    flash.error = "An error occurred while saving added professors!"
                }
            }
        }

        flash.message="Update success!"
        redirect(controller: 'subject', action: 'show', params: [id: s.id])
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
        Subject s = Subject.get(id)

        log.debug("dohvaceni kolgij")
        log.debug(s?.name)

        //TODO

        try
        {
            s.delete(flush: true)
            flash.message="Delete success!"
            redirect(controller: 'subject', action: 'list')
            return
        }
        catch (DataIntegrityViolationException e)
        {
            flash.error="Error on delete!"
            redirect(controller: 'subject', action: 'list')
            return

        }
    }

}
