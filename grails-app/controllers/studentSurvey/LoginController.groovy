package studentSurvey

class LoginController {

    def index() {}

    def login()
    {

    }


    def saveAuth(){

        if(SecurityUtil.getLoggedInUser()){
            redirect(controller: 'logout', action: 'clear', params:[loginError:"You were logged in, all sessions were cleared out for you. Try login again."])
            return;
        }
//        println(new Date().format("dd/MM/yyyy HH:mm:ss")+" - saveAuth() : ")
        def strUsername = params.txt_username.toString()
        def strPassword = params.txt_password.toString()
        def myParams = [:]


        def userInfo = Professor.findByEMailAndPassword(params.username, params.password)
        if (userInfo) {
            session.setAttribute(Constants.ATTR_USERNAME, userInfo.eMail)
            session.setMaxInactiveInterval(Constants.SESSION_TIMEOUT_SEC)
            redirect(action: "redirectTo")
        }
        else{
            log.debug("user postoji u sessionu")
            def returnTo = session.getAttribute(Constants.ATTR_RETURN_TO)
            if (returnTo != null) {
                myParams.put(Constants.ATTR_RETURN_TO, returnTo)
            }
            myParams.put('txt_username', strUsername)
            redirect(action: 'failAuth', params: myParams)
        }
    }

    def redirectTo(){
        String username = session.getAttribute(Constants.ATTR_USERNAME)
        Professor p = Professor.findByEMail(username)

        String strToken = TokenUtil.generateToken(username);

//        String strUrl = uriScheme + appInfo.appUrl + devPath + "/?token=${strToken}"

        ProfessorRole pr = ProfessorRole.findByProfessorID(p?.id)
        if(pr != null){
            log.debug("professor role found!")
            session.setAttribute(Constants.ATTR_ROLE, Role.get(pr?.roleID).authority)
//            redirect(controller: 'survey', action: 'list', params: [roleID: pr?.roleID, professorID: p?.id])
            redirect(controller: 'survey', action: 'list')
        }else{
            log.debug("professor role not found!")
            flash.error = "Professor has no assigned roles!"
            redirect(action: 'login')
        }

    }

    def dologin()
    {

        log.debug("inside doLogin")
        log.debug(params)


        if(params.username == "student")
        {
            //logirana osoba je student

            String subjectPin = params.password
            Survey a = Survey.findBySurveyPin(subjectPin)

            log.debug("dohvacena anketa:")
            log.debug(a.subjectID)

            redirect(controller: 'survey', action: 'showSurvey', params: [professorID: a?.professorID, subjectID: a?.subjectID])
//
//            Survey createdSurvey = new Survey(professorID: params.professorID,
//                    subjectID: params.selectSubject,
//                    dateCreated: now,
//                    expirationDate:targetTime,
//                    surveyPin: params.passwordSurvey)



        }
        else
        {
            //logirana osoba je profesor
            log.debug("its professor")

            Professor p = Professor.findByEMailAndPassword(params.username, params.password)

            if(p != null){

                log.debug("professor found!")
                log.debug(p?.eMail)
                log.debug(p?.id)

//                List<ProfessorRole> prList = ProfessorRole.list()
//
//                prList.each {
//                    log.debug("it")
//                    log.debug(it.professorID)
//                    log.debug(it.roleID)
//
//                }
//                Long roleID = ProfessorRole.executeQuery("SELECT pr.roleID FROM ProfessorRole pr WHERE pr.professorID = :profID",
//                        [profID: p.id])[0]
//
//
//                log.debug("************")
//                log.debug(roleID)

                ProfessorRole pr = ProfessorRole.findByProfessorID(p?.id)


                if(pr != null)
                {

                    log.debug("professor role found!")
                    redirect(controller: 'survey', action: 'list', params: [roleID: pr?.roleID, professorID: p?.id])

                }
                else
                {
                    log.debug("professor role not found!")

                    flash.error = "Professor has no assigned roles!"
                    redirect(action: 'login')
                }

            }
            else
            {
                flash.error = "Professor with this username not found!"
                redirect(action: 'login')
            }

        }

    }


}
