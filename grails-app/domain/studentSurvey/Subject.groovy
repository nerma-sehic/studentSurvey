package studentSurvey

class Subject {

    String name
    Integer ects
    //ECTS

    static constraints = {
        name   nullable: false
        ects   nullable: true
    }
}
