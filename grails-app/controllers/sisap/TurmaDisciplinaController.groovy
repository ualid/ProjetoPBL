package sisap

import org.springframework.dao.DataIntegrityViolationException

class TurmaDisciplinaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [turmaDisciplinaInstanceList: TurmaDisciplina.list(params), turmaDisciplinaInstanceTotal: TurmaDisciplina.count()]
    }

    def create() {
        [turmaDisciplinaInstance: new TurmaDisciplina(params)]
    }

    def save() {
        def turmaDisciplinaInstance = new TurmaDisciplina(params)
        if (!turmaDisciplinaInstance.save(flush: true)) {
            render(view: "create", model: [turmaDisciplinaInstance: turmaDisciplinaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), turmaDisciplinaInstance.id])
        redirect(action: "show", id: turmaDisciplinaInstance.id)
    }

    def show(Long id) {
        def turmaDisciplinaInstance = TurmaDisciplina.get(id)
        if (!turmaDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), id])
            redirect(action: "list")
            return
        }

        [turmaDisciplinaInstance: turmaDisciplinaInstance]
    }

    def edit(Long id) {
        def turmaDisciplinaInstance = TurmaDisciplina.get(id)
        if (!turmaDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), id])
            redirect(action: "list")
            return
        }

        [turmaDisciplinaInstance: turmaDisciplinaInstance]
    }

    def update(Long id, Long version) {
        def turmaDisciplinaInstance = TurmaDisciplina.get(id)
        if (!turmaDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (turmaDisciplinaInstance.version > version) {
                turmaDisciplinaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina')] as Object[],
                          "Another user has updated this TurmaDisciplina while you were editing")
                render(view: "edit", model: [turmaDisciplinaInstance: turmaDisciplinaInstance])
                return
            }
        }

        turmaDisciplinaInstance.properties = params

        if (!turmaDisciplinaInstance.save(flush: true)) {
            render(view: "edit", model: [turmaDisciplinaInstance: turmaDisciplinaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), turmaDisciplinaInstance.id])
        redirect(action: "show", id: turmaDisciplinaInstance.id)
    }

    def delete(Long id) {
        def turmaDisciplinaInstance = TurmaDisciplina.get(id)
        if (!turmaDisciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), id])
            redirect(action: "list")
            return
        }

        try {
            turmaDisciplinaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'turmaDisciplina.label', default: 'TurmaDisciplina'), id])
            redirect(action: "show", id: id)
        }
    }
}
