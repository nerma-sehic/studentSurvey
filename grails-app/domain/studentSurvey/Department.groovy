package studentSurvey

class Department {

    String depName
    String head

    static constraints = {

        depName  nullable: true
        head nullable:true

    }
}
