package studentSurvey

class Survey {

    Long professorID
    Long subjectID
    Date dateCreated
    Date expirationDate
    String surveyPin

    static constraints = {
        professorID         nullable: true
        subjectID           nullable: true
        dateCreated         nullable: true
        expirationDate      nullable: true
        surveyPin           nullable: true
    }
}
