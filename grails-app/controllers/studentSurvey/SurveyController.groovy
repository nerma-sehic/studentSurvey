package studentSurvey

import org.apache.commons.lang.time.DateUtils

class SurveyController {

    def index() {}

    def list(){

        String usernameSession = session.getAttribute(Constants.ATTR_USERNAME)
        String roleSession = session.getAttribute(Constants.ATTR_ROLE)

        log.debug("podaci iz sessiona")
        log.debug(usernameSession)
        log.debug(roleSession)

        log.debug("inside anketa list")
        log.debug(params)

//        List<Professor> professorList = []   //dohvaæam listu svih profesora, s login prikaza zelim uzet e-mail
                                                //i ispisat podatke od tog profesora



//        Long professorID = Long.valueOf(params.professorID)
        Long professorID = Professor.findByEMail(usernameSession)?.id
        Role role = Role.findByAuthority(roleSession)
        Professor p = Professor.get(professorID)
        List<Subject> subjectList = []

        List<ProfessorSubject> professorSubjectList = ProfessorSubject.findAllByProfessorID(professorID)

        professorSubjectList.each {
            Subject s = Subject.get(it.subjectID)
            subjectList.add(s)
        }

        return [professor: p, role: role, subjectList: subjectList]

    }

    def ajaxLoadSurveyTable()
    {
        List<Question> questionList = Question.list()
        List <Answer> answerList = Answer.list()
        log.debug("Lista Pitanja")
        log.debug("Lista Odgovora")
        questionList.each { question ->
            log.debug(question.id + " " + question.questionText)
        }
        answerList.each {answer ->
            log.debug(answer.id + " " + answer.comment + " " + answer.value)
        }

        Professor currentProfessor = Professor.get(Long.valueOf(params.professorID))
        Subject currentSubject = Subject.get(Long.valueOf(params.subjectID))

        log.debug("Dohvaceni prof i predmet:")
        log.debug(currentProfessor.lastName)
        log.debug(currentSubject.name)


        render(template: "table", model: [questionList: questionList, answerList: answerList,
                                          currentProfessor: currentProfessor, currentSubject: currentSubject])
    }

    def showSurvey(Long id)
    {
        Professor currentProfessor = Professor.get(Long.valueOf(params.professorID))
        Subject currentSubject = Subject.get(Long.valueOf(params.subjectID))

        log.debug("Dohvaceni prof i predmet:")
        log.debug(currentProfessor.lastName)
        log.debug(currentSubject.name)

    }


    def saveSurveyResults(){
        log.debug("inside saveSurveyResults")
        log.debug(params)

        params.each{

            if (it.key.startsWith('pitanje-')) {


                log.debug(it.key)
                //"pitanje-1" --> ["pitanje", "1"]
                Long questionID = Long.valueOf(it.key.split('-')[1])
                String answer = it.value

                log.debug("questionID")
                log.debug(questionID)

                log.debug("answer")
                log.debug(answer)



            }

        }

    }


    def createSurvey(){
        log.debug("inside createSurvey")
        log.debug(params)

        int addMinuteTime = 10;
        Date targetTime = new Date(); //now
        targetTime = DateUtils.addMinutes(targetTime, addMinuteTime); //add minute
        Date now = new Date()
        log.debug(targetTime)
        log.debug(now)



        Survey novaAnketa = new Survey(professorID: params.professorID,
                                        subjectID: params.selectSubject,
                                        dateCreated: now,
                                        expirationDate:targetTime,
                                        surveyPin: params.passwordSurvey)
        ProfessorRole pr = ProfessorRole.findByProfessorID(Long.valueOf(params.professorID))

        if(!novaAnketa.save(flush: true)){
            flash.error = "Error on saving survey"

            redirect(action: "list", params: [professorID: params.professorID, roleID: pr.roleID])
        }

        flash.message = "Survey successfully saved!"
        redirect(action: "list", params: [professorID: params.professorID, roleID: pr.roleID])



    }
}


