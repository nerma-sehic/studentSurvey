package studentSurvey

class SurveyResults {

    Long surveyID
    Long professorID
    Long subjectID
    Date dateCreated
    Long questionID
    Long answerID

    static constraints = {
        professorID             nullable: true
        subjectID               nullable: true
        dateCreated             nullable: true
        questionID              nullable: true
        answerID                nullable: true
        surveyID                nullable: true
    }
}
