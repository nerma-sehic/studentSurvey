import studentSurvey.Answer
import studentSurvey.Question
import studentSurvey.Professor
import studentSurvey.Subject
import studentSurvey.Department

class BootStrap {

    def init = { servletContext ->

        List<Question> questionList = Question.list() //dohva�amo sva pitanja iz baze
        List<Answer> answerList = Answer.list()  //dohva�amo odgovore
        List<Professor> professorList = Professor.list() //dohva�amo profesre
        List<Subject> subjectList = Subject.list()//dohva�a predmete
        List<Department> departmentList = Department.list() //dohva�a odsjeke

        if (questionList.size() == 0 || questionList == null) {

            //ne postoje mi pitanja u bazi

            Question q1 = new Question(questionText: "Spol:")
            q1.save(flush: true)

            Question q2 = new Question(questionText: "Smtrate li da imate potrebno predznanje za kolegij?")
            q2.save(flush: true)

            Question q3 = new Question(questionText: "Kakav je Va� interes za problematiku kolegija?")
            q3.save(flush: true)

            Question q4 = new Question(questionText: "Uklapa li se kolegij u Va� smijer?")
            q4.save(flush: true)

            Question q5 = new Question(questionText: "Nastava se odr�ava na vrijeme i redovito?")
            q5.save(flush: true)

            Question q6 = new Question(questionText: "Mislite li da bi se kroz kolegij trebalo u�iti nes�to drugo ? Ako da, �to?")
            q6.save(flush: true)

            Question q7 = new Question(questionText: "Smatrate li da bi kolegij trebao biti smje�ten na neku drugu godinu studija?")
            q7.save(flush: true)

            Question q8 = new Question(questionText: "Treba li osuvremeniti kolegij i nastavni materijal?")
            q8.save(flush: true)

            Question q9 = new Question(questionText: "Nastavni materijali su razumljivi i lako dostupni?")
            q9.save(flush: true)

            Question q10 = new Question(questionText: "Nastavnik/suradnik Vas je na jasan i razmljiv na�in upoznao sa sadr�ajem i izvedbenim planom kolegija?")
            q10.save(flush: true)

            Question q11 = new Question(questionText: "Jasno su definirani na�ini i kriteriji ocjenjivanja studenata?")
            q11.save(flush: true)

            Question q12 = new Question(questionText: "Nastavnik/suradnik se trudi objasniti gradivo kroz dodatne primjere?")
            q12.save(flush: true)

            Question q13 = new Question(questionText: "Nastavnik/suradnik poti�e na interakciju i motivira za sudjelovanje u nastavi?")
            q13.save(flush: true)

            Question q14 = new Question(questionText: "Nastavnik/suradnik je objektivan u ocjenjivanju Vas i Va�ih kolega?")
            q14.save(flush: true)

            Question q15 = new Question(questionText: "Nastavnik/suradnik je korektan u komunikaciji sa studentima i spreman je pomo�i u rje�avanju problema vezanih za kolegij?")
            q15.save(flush: true)

            Question q16 = new Question(questionText: "Nastavnik/suradnik razumljivo izla�e nastavne sadr�aje?")
            q16.save(flush: true)

            Question q17 = new Question(questionText: "Kojom ocjenom biste Vi ocijenili nastavnika ako se u obziru uzmu sve njegove kvalitete i nedostaci?")
            q17.save(flush: true)

            Question q18 = new Question(questionText: "�to biste Vi promijenili u nastavi kolegija kako bi pove�ali kvalitetu nastave?")
            q18.save(flush: true)

            Question q19 = new Question(questionText: "Imate li pohvale i/ili kritike na ra�un nastavnika/suradnika?")
            q19.save(flush: true)

            Question q20 = new Question(questionText: "Smatrate li da ste kroz predavanja i laboratorijske vje�be dovljno nau�ili i obradili gradivo za dobivanje prolazne ocjene iz kolegija ?")
            q20.save(flush: true)
        }

        if (answerList.size() == 0 || answerList == null) {
            println("answer list is null or size 0")

            Answer a1 = new Answer(comment: "Mu�ko")
            a1.save(flush: true)

            Answer a2 = new Answer(comment: "�ensko")
            a2.save(flush: true)

            Answer a3 = new Answer(value: 1)
            a3.save(flush: true)

            Answer a4 = new Answer(value: 2)
            a4.save(flush: true)

            Answer a5 = new Answer(value: 3)
            a5.save(flush: true)

            Answer a6 = new Answer(value: 4)
            a6.save(flush: true)

            Answer a7 = new Answer(value: 5)
            a7.save(flush: true)

            Answer a8 = new Answer(comment: "freeEntry")
            a8.save(flush: true)

        }

        if (professorList.size() == 0 || professorList == null) {

            String theDate = "23.09.1985.";
            Date newdate = new Date().parse("d.M.yyyy.", theDate)

            Professor p1 = new Professor(firstName: "Haidi",
                    lastName: "Bo�ikovi�",
                    address: "Kopilica 5",
                    cellPhone: 911,
                    eMail: "hbozikovic@mail.com",
                    birthday: newdate
            )
            p1.save(flush: true)

            Professor p2 = new Professor(firstName: "Ljiljana", lastName: "Despalatovi�", address: "Kopilica 6", cellPhone: 912, eMail: "ljdespalatovic@mail.com")
            p2.save(flush: true)

            Professor p3 = new Professor(firstName: "Marina", lastName: "Rodi�", address: "Kopilica 7", cellPhone: 913, eMail: "mrodic@gmail.com")
            p3.save(flush: true)

            Professor p4 = new Professor(firstName: "Karmen", lastName: "Klarin", address: "Kopilica 8", cellPhone: 914, eMail: "kklarin@mail.com")
            p4.save(flush: true)

            Professor p5 = new Professor(firstName: "Tatjana",
                    lastName: "Liste�",
                    address: "Kopilica 5",
                    cellPhone: 915,
                    eMail: "tlistes@mail.com")
            p5.save(flush: true)

            Professor p6 = new Professor(firstName: "Lada", lastName: "Sartori", address: "Kopilica 10", cellPhone: 916, eMail: "lsartori@mail.com")
            p6.save(flush: true)

            Professor p7 = new Professor(firstName: "Arijana", lastName: "Burazin-Mi�ura", address: "Kopilica 1", cellPhone: 917, eMail: "aburazinmisura@mail.com")
            p7.save(flush: true)

            Professor p8 = new Professor(firstName: "Ivana", lastName: "�izmi�", address: "Kopilica 8", cellPhone: 918, eMail: "icizmic@mail.com")
            p8.save(flush: true)

            Professor p9 = new Professor(firstName: "Silvana", lastName: "Kosanovi�", address: "Kopilica 15", cellPhone: 920, eMail: "skosanovic@mail.com")
            p9.save(flush: true)

            Professor p10 = new Professor(firstName: "Jelena", lastName: "Slugan", address: "Kopilica 5", cellPhone: 963, eMail: "jslugan@mail.com")
            p10.save(flush: true)

            Professor p11 = new Professor(firstName: "Renata", lastName: "Ko�ul-Bla�evski", address: "Kopilica 12", cellPhone: 9110, eMail: "rkozulblazevski@mail.com")
            p11.save(flush: true)

            Professor p12 = new Professor(firstName: "Nada", lastName: "Rogulji�", address: "Kopilica 8", cellPhone: 625, eMail: "nroguljic@mail.com")
            p12.save(flush: true)

            Professor p13 = new Professor(firstName: "Ivo", lastName: "Baras", address: "Kopilica 30", cellPhone: 514, eMail: "ibaras@mail.com")
            p13.save(flush: true)

            Professor p14 = new Professor(firstName: "Stipe", lastName: "Braica", address: "Kopilica 21", cellPhone: 621, eMail: "sbraica@mail.com")
            p14.save(flush: true)

            Professor p15 = new Professor(firstName: "Nikola", lastName: "Grgi�", address: "Kopilica 18", cellPhone: 514, eMail: "ngrgic@mail.com")
            p15.save(flush: true)

            Professor p16 = new Professor(firstName: "Ivan", lastName: "Ked�o", address: "Kopilica 12", cellPhone: 245, eMail: "ikedzo@mail.com")
            p16.save(flush: true)

            Professor p17 = new Professor(firstName: "Tonko", lastName: "Kova�evi�", address: "Kopilica 32", cellPhone: 632, eMail: "tkovacevic@mail.com")
            p17.save(flush: true)

            Professor p18 = new Professor(firstName: "Valentini", lastName: "Ko�ica", address: "Kopilica 45", cellPhone: 452, eMail: "vkozica@mail.com")
            p18.save(flush: true)

            Professor p19 = new Professor(firstName: "Igor", lastName: "Nazor", address: "Kopilica 1", cellPhone: 512, eMail: "inazor@mail.com")
            p19.save(flush: true)

            Professor p20 = new Professor(firstName: "Toma", lastName: "Ron�evi�", address: "Kopilica 8", cellPhone: 627, eMail: "troncevic@mail.com")
            p20.save(flush: true)

            Professor p21 = new Professor(firstName: "Ivica", lastName: "Ru�i�", address: "Kopilica 12", cellPhone: 489, eMail: "iruzic@mail.com")
            p21.save(flush: true)

            Professor p22 = new Professor(firstName: "Josip", lastName: "Vrli�", address: "Kopilica 85", cellPhone: 496, eMail: "jvrlic@mail.com")
            p22.save(flush: true)

            Professor p23 = new Professor(firstName: "Sini�a", lastName: "Zorica", address: "Kopilica 25", cellPhone: 436, eMail: "szorica@mail.com")
            p23.save(flush: true)

            Professor p24 = new Professor(firstName: "Teo", lastName: "�uljevi�", address: "Kopilica 22", cellPhone: 395, eMail: "tzuljevic@mail.com")
            p24.save(flush: true)

            Professor p25 = new Professor(firstName: "Alen", lastName: "Pezelj", address: "Kopilica 31", cellPhone: 727, eMail: "apezelj@mail.com")
            p25.save(flush: true)
        }

        if (subjectList.size() == 0 || subjectList == null ){
            Subject s1 = new Subject(name: "Linearna alegebra", ects: 6)
            s1.save(flush: true)

            Subject s2 = new Subject(name: "Fizika", ects: 5)
            s2.save(flush: true)

            Subject s3 = new Subject(name: "Uvod u programiranje", ects: 6)
            s3.save(flush: true)

            Subject s4 = new Subject(name: "Digitalna i mikroprocesorska tehnika", ects: 6)
            s4.save(flush: true)

            Subject s5 = new Subject(name: "Osnove elektrotehnike i elektronike", ects: 7)
            s5.save(flush: true)

            Subject s6 = new Subject(name: "Analiza 1", ects: 6)
            s6.save(flush: true)

            Subject s7 = new Subject(name: "Operativni sustavi",ects: 6)
            s7.save(flush: true)

            Subject s8 = new Subject(name: "Arhitektura i organizacija digitalnih ra�unala", ects: 6)
            s8.save(flush: true)

            Subject s9 = new Subject(name: "Programske metode i apstrakcije", ects: 6)
            s9.save(flush: true)

            Subject s10 = new Subject(name: "Tehni�ki engleski jezik", ects: 4)
            s10.save(flush: true)

            Subject s11 = new Subject(name: "Ekonomika i organizacija poduze�a", ects: 2)
            s11.save(flush: true)

            Subject s12 = new Subject(name: "Primjenjena i numeri�ka matematika", ects: 6)
            s12.save(flush: true)

            Subject s13 = new Subject(name: "Baze podataka", ects: 6)
            s13.save(flush: true)

            Subject s14 = new Subject(name: "Informacijski sustavi", ects: 6)
            s14.save(flush: true)

            Subject s15 = new Subject(name: "Strukture podataka i algoritmi", ects: 6)
            s15.save(flush: true)

            Subject s16 = new Subject(name: "Ra�unalne mre�e", ects: 6)
            s16.save(flush: true)

            Subject s17 = new Subject(name: "Diskretna matematika", ects: 6)
            s17.save(flush: true)

            Subject s18 = new Subject(name: "Mre�ne usluge i programiranje", ects: 6)
            s18.save(flush: true)

            Subject s19 = new Subject(name: "Objektno programiranje", ects: 6)
            s19.save(flush: true)

            Subject s20 = new Subject(name: "Arhitektura osobnih ra�unala", ects: 6)
            s20.save(flush: true)

            Subject s21 = new Subject(name: "Projektiranje i upravljanje ra�unalnim mre�ama", ects: 6)
            s21.save(flush: true)

            Subject s22 = new Subject(name: "Projektiranje informacijskih sustava", ects: 6)
            s22.save(flush: true)

            Subject s23 = new Subject(name: "Informatizacija poslovanja", ects: 6)
            s23.save(flush: true)

            Subject s24 = new Subject(name: "Programiranje u Javi", ects: 6)
            s24.save(flush: true)

            Subject s25 = new Subject(name: "Analiza i obrada podataka", ects: 6)
            s25.save(flush: true)

            Subject s26 = new Subject(name: "Sigurnost ra�unala i podataka", ects: 6)
            s26.save(flush: true)

            Subject s27 = new Subject(name: "Oblikovanje web stranica", ects: 6)
            s27.save(flush: true)

            Subject s28 = new Subject(name: "Objektno orijentirano modeliranje", ects: 6)
            s28.save(flush: true)

            Subject s29 = new Subject(name: "Osnove njema�kog jezika", ects: 4)
            s29.save(flush: true)

            Subject s30 = new Subject(name: "Programski alati na UNIX ra�unalima", ects: 6)
            s30.save(flush: true)
        }

        if (departmentList.size() == 0 || departmentList == null )
        {
            Department d1 = new Department(depName: "Informacijske tehnologije", head: "mr. sc. Ivica Ru�i�, vi�i predava�")
            d1.save(flush: true)

            Department d2 = new Department(depName: "Strojarstvo", head: "dr. sc. Ado Matokovi�, prof. v.�.")
            d2.save(flush: true)

            Department d3 = new Department(depName: "Elektrotehnika", head: "dr. sc. Tonko Kova�evi�, vi�i predava�")
            d3.save(flush: true)

            Department d4 = new Department(depName: "Ra�unovodstvo i financije", head: "dr. sc. Domagoja Buljan Barba�a, prof. v.�. u trajnom zvanju")
            d4.save(flush: true)

            Department d5 = new Department(depName: "Trgovinsko poslovanje", head: "dr. sc. Goran �orluka, predava�")
            d5.save(flush: true)

        }

    }

    def destroy = {
    }
}
