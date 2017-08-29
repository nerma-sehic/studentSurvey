import studentSurvey.Answer
import studentSurvey.Question
import studentSurvey.Professor
import studentSurvey.Subject
import studentSurvey.Department

class BootStrap {

    def init = { servletContext ->

        List<Question> questionList = Question.list() //dohvaæamo sva pitanja iz baze
        List<Answer> answerList = Answer.list()  //dohvaæamo odgovore
        List<Professor> professorList = Professor.list() //dohvaæamo profesre
        List<Subject> subjectList = Subject.list()//dohvaæa predmete
        List<Department> departmentList = Department.list() //dohvaæa odsjeke

        if (questionList.size() == 0 || questionList == null) {

            //ne postoje mi pitanja u bazi

            Question q1 = new Question(questionText: "Spol:")
            q1.save(flush: true)

            Question q2 = new Question(questionText: "Smtrate li da imate potrebno predznanje za kolegij?")
            q2.save(flush: true)

            Question q3 = new Question(questionText: "Kakav je Vaš interes za problematiku kolegija?")
            q3.save(flush: true)

            Question q4 = new Question(questionText: "Uklapa li se kolegij u Vaš smijer?")
            q4.save(flush: true)

            Question q5 = new Question(questionText: "Nastava se održava na vrijeme i redovito?")
            q5.save(flush: true)

            Question q6 = new Question(questionText: "Mislite li da bi se kroz kolegij trebalo uèiti nesšto drugo ? Ako da, što?")
            q6.save(flush: true)

            Question q7 = new Question(questionText: "Smatrate li da bi kolegij trebao biti smješten na neku drugu godinu studija?")
            q7.save(flush: true)

            Question q8 = new Question(questionText: "Treba li osuvremeniti kolegij i nastavni materijal?")
            q8.save(flush: true)

            Question q9 = new Question(questionText: "Nastavni materijali su razumljivi i lako dostupni?")
            q9.save(flush: true)

            Question q10 = new Question(questionText: "Nastavnik/suradnik Vas je na jasan i razmljiv naèin upoznao sa sadržajem i izvedbenim planom kolegija?")
            q10.save(flush: true)

            Question q11 = new Question(questionText: "Jasno su definirani naèini i kriteriji ocjenjivanja studenata?")
            q11.save(flush: true)

            Question q12 = new Question(questionText: "Nastavnik/suradnik se trudi objasniti gradivo kroz dodatne primjere?")
            q12.save(flush: true)

            Question q13 = new Question(questionText: "Nastavnik/suradnik potièe na interakciju i motivira za sudjelovanje u nastavi?")
            q13.save(flush: true)

            Question q14 = new Question(questionText: "Nastavnik/suradnik je objektivan u ocjenjivanju Vas i Vaših kolega?")
            q14.save(flush: true)

            Question q15 = new Question(questionText: "Nastavnik/suradnik je korektan u komunikaciji sa studentima i spreman je pomoæi u rješavanju problema vezanih za kolegij?")
            q15.save(flush: true)

            Question q16 = new Question(questionText: "Nastavnik/suradnik razumljivo izlaže nastavne sadržaje?")
            q16.save(flush: true)

            Question q17 = new Question(questionText: "Kojom ocjenom biste Vi ocijenili nastavnika ako se u obziru uzmu sve njegove kvalitete i nedostaci?")
            q17.save(flush: true)

            Question q18 = new Question(questionText: "Što biste Vi promijenili u nastavi kolegija kako bi poveæali kvalitetu nastave?")
            q18.save(flush: true)

            Question q19 = new Question(questionText: "Imate li pohvale i/ili kritike na raèun nastavnika/suradnika?")
            q19.save(flush: true)

            Question q20 = new Question(questionText: "Smatrate li da ste kroz predavanja i laboratorijske vježbe dovljno nauèili i obradili gradivo za dobivanje prolazne ocjene iz kolegija ?")
            q20.save(flush: true)
        }

        if (answerList.size() == 0 || answerList == null) {
            println("answer list is null or size 0")

            Answer a1 = new Answer(comment: "Muško")
            a1.save(flush: true)

            Answer a2 = new Answer(comment: "Žensko")
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
                    lastName: "Božikoviæ",
                    address: "Kopilica 5",
                    cellPhone: 911,
                    eMail: "hbozikovic@mail.com",
                    birthday: newdate
            )
            p1.save(flush: true)

            Professor p2 = new Professor(firstName: "Ljiljana", lastName: "Despalatoviæ", address: "Kopilica 6", cellPhone: 912, eMail: "ljdespalatovic@mail.com")
            p2.save(flush: true)

            Professor p3 = new Professor(firstName: "Marina", lastName: "Rodiæ", address: "Kopilica 7", cellPhone: 913, eMail: "mrodic@gmail.com")
            p3.save(flush: true)

            Professor p4 = new Professor(firstName: "Karmen", lastName: "Klarin", address: "Kopilica 8", cellPhone: 914, eMail: "kklarin@mail.com")
            p4.save(flush: true)

            Professor p5 = new Professor(firstName: "Tatjana",
                    lastName: "Listeš",
                    address: "Kopilica 5",
                    cellPhone: 915,
                    eMail: "tlistes@mail.com")
            p5.save(flush: true)

            Professor p6 = new Professor(firstName: "Lada", lastName: "Sartori", address: "Kopilica 10", cellPhone: 916, eMail: "lsartori@mail.com")
            p6.save(flush: true)

            Professor p7 = new Professor(firstName: "Arijana", lastName: "Burazin-Mišura", address: "Kopilica 1", cellPhone: 917, eMail: "aburazinmisura@mail.com")
            p7.save(flush: true)

            Professor p8 = new Professor(firstName: "Ivana", lastName: "Èizmiæ", address: "Kopilica 8", cellPhone: 918, eMail: "icizmic@mail.com")
            p8.save(flush: true)

            Professor p9 = new Professor(firstName: "Silvana", lastName: "Kosanoviæ", address: "Kopilica 15", cellPhone: 920, eMail: "skosanovic@mail.com")
            p9.save(flush: true)

            Professor p10 = new Professor(firstName: "Jelena", lastName: "Slugan", address: "Kopilica 5", cellPhone: 963, eMail: "jslugan@mail.com")
            p10.save(flush: true)

            Professor p11 = new Professor(firstName: "Renata", lastName: "Kožul-Blaževski", address: "Kopilica 12", cellPhone: 9110, eMail: "rkozulblazevski@mail.com")
            p11.save(flush: true)

            Professor p12 = new Professor(firstName: "Nada", lastName: "Roguljiæ", address: "Kopilica 8", cellPhone: 625, eMail: "nroguljic@mail.com")
            p12.save(flush: true)

            Professor p13 = new Professor(firstName: "Ivo", lastName: "Baras", address: "Kopilica 30", cellPhone: 514, eMail: "ibaras@mail.com")
            p13.save(flush: true)

            Professor p14 = new Professor(firstName: "Stipe", lastName: "Braica", address: "Kopilica 21", cellPhone: 621, eMail: "sbraica@mail.com")
            p14.save(flush: true)

            Professor p15 = new Professor(firstName: "Nikola", lastName: "Grgiæ", address: "Kopilica 18", cellPhone: 514, eMail: "ngrgic@mail.com")
            p15.save(flush: true)

            Professor p16 = new Professor(firstName: "Ivan", lastName: "Kedžo", address: "Kopilica 12", cellPhone: 245, eMail: "ikedzo@mail.com")
            p16.save(flush: true)

            Professor p17 = new Professor(firstName: "Tonko", lastName: "Kovaèeviæ", address: "Kopilica 32", cellPhone: 632, eMail: "tkovacevic@mail.com")
            p17.save(flush: true)

            Professor p18 = new Professor(firstName: "Valentini", lastName: "Kožica", address: "Kopilica 45", cellPhone: 452, eMail: "vkozica@mail.com")
            p18.save(flush: true)

            Professor p19 = new Professor(firstName: "Igor", lastName: "Nazor", address: "Kopilica 1", cellPhone: 512, eMail: "inazor@mail.com")
            p19.save(flush: true)

            Professor p20 = new Professor(firstName: "Toma", lastName: "Ronèeviæ", address: "Kopilica 8", cellPhone: 627, eMail: "troncevic@mail.com")
            p20.save(flush: true)

            Professor p21 = new Professor(firstName: "Ivica", lastName: "Ružiæ", address: "Kopilica 12", cellPhone: 489, eMail: "iruzic@mail.com")
            p21.save(flush: true)

            Professor p22 = new Professor(firstName: "Josip", lastName: "Vrliæ", address: "Kopilica 85", cellPhone: 496, eMail: "jvrlic@mail.com")
            p22.save(flush: true)

            Professor p23 = new Professor(firstName: "Siniša", lastName: "Zorica", address: "Kopilica 25", cellPhone: 436, eMail: "szorica@mail.com")
            p23.save(flush: true)

            Professor p24 = new Professor(firstName: "Teo", lastName: "Žuljeviæ", address: "Kopilica 22", cellPhone: 395, eMail: "tzuljevic@mail.com")
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

            Subject s8 = new Subject(name: "Arhitektura i organizacija digitalnih raèunala", ects: 6)
            s8.save(flush: true)

            Subject s9 = new Subject(name: "Programske metode i apstrakcije", ects: 6)
            s9.save(flush: true)

            Subject s10 = new Subject(name: "Tehnièki engleski jezik", ects: 4)
            s10.save(flush: true)

            Subject s11 = new Subject(name: "Ekonomika i organizacija poduzeæa", ects: 2)
            s11.save(flush: true)

            Subject s12 = new Subject(name: "Primjenjena i numerièka matematika", ects: 6)
            s12.save(flush: true)

            Subject s13 = new Subject(name: "Baze podataka", ects: 6)
            s13.save(flush: true)

            Subject s14 = new Subject(name: "Informacijski sustavi", ects: 6)
            s14.save(flush: true)

            Subject s15 = new Subject(name: "Strukture podataka i algoritmi", ects: 6)
            s15.save(flush: true)

            Subject s16 = new Subject(name: "Raèunalne mreže", ects: 6)
            s16.save(flush: true)

            Subject s17 = new Subject(name: "Diskretna matematika", ects: 6)
            s17.save(flush: true)

            Subject s18 = new Subject(name: "Mrežne usluge i programiranje", ects: 6)
            s18.save(flush: true)

            Subject s19 = new Subject(name: "Objektno programiranje", ects: 6)
            s19.save(flush: true)

            Subject s20 = new Subject(name: "Arhitektura osobnih raèunala", ects: 6)
            s20.save(flush: true)

            Subject s21 = new Subject(name: "Projektiranje i upravljanje raèunalnim mrežama", ects: 6)
            s21.save(flush: true)

            Subject s22 = new Subject(name: "Projektiranje informacijskih sustava", ects: 6)
            s22.save(flush: true)

            Subject s23 = new Subject(name: "Informatizacija poslovanja", ects: 6)
            s23.save(flush: true)

            Subject s24 = new Subject(name: "Programiranje u Javi", ects: 6)
            s24.save(flush: true)

            Subject s25 = new Subject(name: "Analiza i obrada podataka", ects: 6)
            s25.save(flush: true)

            Subject s26 = new Subject(name: "Sigurnost raèunala i podataka", ects: 6)
            s26.save(flush: true)

            Subject s27 = new Subject(name: "Oblikovanje web stranica", ects: 6)
            s27.save(flush: true)

            Subject s28 = new Subject(name: "Objektno orijentirano modeliranje", ects: 6)
            s28.save(flush: true)

            Subject s29 = new Subject(name: "Osnove njemaèkog jezika", ects: 4)
            s29.save(flush: true)

            Subject s30 = new Subject(name: "Programski alati na UNIX raèunalima", ects: 6)
            s30.save(flush: true)
        }

        if (departmentList.size() == 0 || departmentList == null )
        {
            Department d1 = new Department(depName: "Informacijske tehnologije", head: "mr. sc. Ivica Ružiæ, viši predavaè")
            d1.save(flush: true)

            Department d2 = new Department(depName: "Strojarstvo", head: "dr. sc. Ado Matokoviæ, prof. v.š.")
            d2.save(flush: true)

            Department d3 = new Department(depName: "Elektrotehnika", head: "dr. sc. Tonko Kovaèeviæ, viši predavaè")
            d3.save(flush: true)

            Department d4 = new Department(depName: "Raèunovodstvo i financije", head: "dr. sc. Domagoja Buljan Barbaèa, prof. v.š. u trajnom zvanju")
            d4.save(flush: true)

            Department d5 = new Department(depName: "Trgovinsko poslovanje", head: "dr. sc. Goran Æorluka, predavaè")
            d5.save(flush: true)

        }

    }

    def destroy = {
    }
}
