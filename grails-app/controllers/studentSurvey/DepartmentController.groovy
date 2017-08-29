package studentSurvey

import org.springframework.dao.DataIntegrityViolationException

class DepartmentController {

    def index() {}

    def list() {
        log.debug("inside department list")
    }

    def ajaxLoadDepartmentTable() {
        List<Department> departmentList = Department.list()
        log.debug("Lista odsjeka")
        departmentList.each { department ->
            log.debug(department.id + " " + department.depName + " " + department.head)
        }

        render(template: "table", model: [departmentList: departmentList])
    }

    def show(Long id) {
        Department departmentInstance = Department.get(id)
        if (!departmentInstance) {
            flash.error = "An error occurred, department does not exist"
            redirect(action: "list")
            return
        }
        return [departmentInstance: departmentInstance]
    }

    def create() {

    }

    def save() {
        log.debug("params")
        log.debug(params)

        Department d1 = new Department
                (
                        depName: params.depName,
                        head: params.head,
                )

        if (!d1.save(flush: true)) {
            flash.error = "Error on save!"
            redirect(controller: 'department', action: 'create', params: params)
            return
        }

        flash.message = "Save success!"
        redirect(controller: 'department', action: 'list', params: [id: d1.id])
        return
    }

    def edit()
    {
        log.debug("params u edit akciji")
        log.debug(params)

        Department d = Department.get(Long.valueOf(params.id))

        //TODO provjera da li postoji

        return [department: d]
    }

    def update()
    {
        log.debug("params u udpate akcij")
        log.debug(params)

        Department d = Department.get(Long.valueOf(params.id))

        //TODO provjera da li postoji, izbaciti grešku ako ne postoji

        d.depName = params.depName
        d.head = params.head

        if(!d.save(flush: true))
        {
            log.debug("error occurred!")
            flash.error="Error on update!"
            redirect(controller: 'department', action: 'edit', params: params)
            return
        }

        flash.message="Update success!"
        redirect(controller: 'department', action: 'list', params: [id: d.id])
        return
    }

    def ajaxDeleteModal(Long id, String entityName, String controllerName, String actionName) {
        render(template: "/common/deleteModal", model: [entityId           : id,
                                                        entityName         : entityName,
                                                        requestedController: controllerName,
                                                        requestedAction    : actionName])
    }

    def delete(Long id) {

        Department d = Department.get(id)

        log.debug("dohvaceni odsjek")
        log.debug(d?.depName)
        log.debug(d?.head)

        //TODO

        try {
            d.delete(flush: true)
            flash.message = "Delete success!"
            redirect(controller: 'department', action: 'list')
            return
        }
        catch (DataIntegrityViolationException e) {
            flash.error = "Error on delete!"
            redirect(controller: 'department', action: 'list')
            return

        }

    }
}