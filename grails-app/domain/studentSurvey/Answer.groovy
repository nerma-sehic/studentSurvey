package studentSurvey

class Answer
{

    String comment
    Integer value

    static constraints = {
        comment         nullable: true
        value           nullable: true
    }
}
