package studentSurvey

class ProfessorSubject {

    Long subjectID
    Long professorID

    static constraints = {

        subjectID       nullable: true
        professorID     nullable: true
    }
}
