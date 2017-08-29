package studentSurvey

class Professor {

    String firstName
    String lastName
    String address
    String cellPhone
    String eMail
    String password
    Date birthday

    static constraints = {
        firstName       nullable: true
        lastName        nullable: true
        address         nullable: true
        cellPhone       nullable: true
        eMail           nullable: true
        password        nullable: true
        birthday        nullable: true
    }
}
