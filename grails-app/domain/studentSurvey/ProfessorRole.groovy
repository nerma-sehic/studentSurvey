package studentSurvey

class ProfessorRole {

    Long professorID
    Long roleID

    static constraints = {

        professorID         nullable: true
        roleID              nullable: true
    }
}
